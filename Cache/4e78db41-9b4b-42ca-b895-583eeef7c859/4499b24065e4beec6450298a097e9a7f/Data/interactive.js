// Require SIK modules
const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

// @input Component.Text statusText {"hint":"Text component to show pinch status"}

var handProvider;

function initialize() {
    // Try to access hand tracking through SIK interactors
    print("Attempting to access SIK interactors...");
    
    try {
        // Check what's available in interactionManager.interactors
        if (interactionManager && interactionManager.interactors) {
            print("Found interactors object");
            print("Interactors type: " + typeof interactionManager.interactors);
            
            // See what methods/properties are available on interactors
            var interactorsObj = interactionManager.interactors;
            var foundProps = false;
            
            for (var prop in interactorsObj) {
                print("  interactors." + prop + ": " + typeof interactorsObj[prop]);
                foundProps = true;
            }
            
            if (!foundProps) {
                print("  No enumerable properties found on interactors");
                print("  Trying to access interactors directly...");
                
                // Try common hand tracking property names
                var commonProps = ["hands", "handInteractors", "leftHand", "rightHand", "pinchInteractors"];
                for (var i = 0; i < commonProps.length; i++) {
                    var propName = commonProps[i];
                    if (interactorsObj[propName] !== undefined) {
                        print("  Found: interactors." + propName + " = " + typeof interactorsObj[propName]);
                    }
                }
            }
            
            // Try to get hand interactors specifically
            var handInteractors = interactionManager.interactors;
            if (handInteractors) {
                print("Hand interactors found, setting up...");
                setupHandTracking(handInteractors);
            }
        } else {
            print("No interactors found on InteractionManager");
        }
    } catch (error) {
        print("Error accessing interactors: " + error);
    }
    
    updateStatus("Ready - Checking SIK setup...");
    
    // Set up update loop
    var updateEvent = script.createEvent("UpdateEvent");
    updateEvent.bind(checkForInteractions);
}

function setupHandTracking(interactors) {
    try {
        print("Setting up hand tracking with interactors");
        
        // Store reference to interactors
        script.interactors = interactors;
        
        updateStatus("SIK hand tracking ready");
        
    } catch (error) {
        print("Error setting up hand tracking: " + error);
        updateStatus("Hand tracking setup failed");
    }
}

function checkForInteractions() {
    // For now, just check if we can access the interactors
    if (script.interactors) {
        // We'll implement actual pinch detection once we understand the API better
        // updateStatus("Interactors available");
    } else {
        updateStatus("No interactors available");
    }
}

function setupHandEvents() {
    // Listen for hand found/lost events
    handProvider.onHandFound.add(function(hand) {
        var handIndex = hand.handType; // 0 = left, 1 = right
        var handSide = (handIndex === 0) ? "Left" : "Right";
        print(`${handSide} hand found!`);
        updateStatus(`${handSide} hand detected`);
    });
    
    handProvider.onHandLost.add(function(hand) {
        var handIndex = hand.handType;
        var handSide = (handIndex === 0) ? "Left" : "Right";
        print(`${handSide} hand lost`);
        updateStatus("Hand lost");
    });
}

function checkForPinches() {
    // Check both hands for pinch gestures
    var leftHand = handProvider.getHand(0);  // Left hand
    var rightHand = handProvider.getHand(1); // Right hand
    
    if (leftHand) {
        checkHandPinch(leftHand, "Left", 0);
    }
    
    if (rightHand) {
        checkHandPinch(rightHand, "Right", 1);
    }
    
    // Show ready state when no hands
    if (!leftHand && !rightHand) {
        updateStatus("Ready - Try pinching!");
    }
}

function checkHandPinch(hand, handSide, handIndex) {
    try {
        // Get pinch strength (0.0 to 1.0)
        var pinchStrength = hand.getPinchStrength();
        
        // Store previous pinch state on the hand object
        var wasStrongPinch = hand.wasStrongPinch || false;
        
        // Detect strong pinch (threshold 0.7)
        if (pinchStrength > 0.7 && !wasStrongPinch) {
            onPinchDetected(hand, handSide, pinchStrength);
            hand.wasStrongPinch = true;
        }
        // Detect pinch release (threshold 0.3)
        else if (pinchStrength < 0.3 && wasStrongPinch) {
            onPinchReleased(hand, handSide);
            hand.wasStrongPinch = false;
        }
        
        // Show real-time pinch strength for active pinches
        if (pinchStrength > 0.1) {
            updateStatus(`${handSide} pinch: ${pinchStrength.toFixed(2)}`);
        }
        
    } catch (error) {
        print(`Error checking pinch for ${handSide} hand: ${error}`);
    }
}

function onPinchDetected(hand, handSide, strength) {
    try {
        // Get finger tip positions
        var thumbTip = hand.getThumbTip();
        var indexTip = hand.getIndexTip();
        
        if (thumbTip && indexTip) {
            // Calculate pinch position (midpoint between thumb and index)
            var thumbPos = thumbTip.position;
            var indexPos = indexTip.position;
            var pinchPos = vec3.lerp(thumbPos, indexPos, 0.5);
            
            print(`🤏 ${handSide} PINCH DETECTED!`);
            print(`   Strength: ${strength.toFixed(2)}`);
            print(`   Position: (${pinchPos.x.toFixed(2)}, ${pinchPos.y.toFixed(2)}, ${pinchPos.z.toFixed(2)})`);
            print(`   Thumb: (${thumbPos.x.toFixed(2)}, ${thumbPos.y.toFixed(2)}, ${thumbPos.z.toFixed(2)})`);
            print(`   Index: (${indexPos.x.toFixed(2)}, ${indexPos.y.toFixed(2)}, ${indexPos.z.toFixed(2)})`);
            
            updateStatus(`${handSide} PINCH! 🤏`);
            
            // This is where particle pop effect would be triggered
            print("   -> Ready for particle pop effect!");
            
        } else {
            print(`${handSide} pinch detected but finger positions unavailable`);
        }
        
    } catch (error) {
        print(`Error processing pinch for ${handSide}: ${error}`);
    }
}

function onPinchReleased(hand, handSide) {
    print(`👋 ${handSide} pinch released`);
    updateStatus(`${handSide} released`);
}

function updateStatus(message) {
    if (script.statusText) {
        script.statusText.text = message;
    }
}

// Debug function to check SIK availability
function checkSIKAvailability() {
    print("=== SIK Availability Check ===");
    print("SIK: " + typeof SIK);
    
    if (typeof SIK !== 'undefined') {
        print("SIK.InteractionManager: " + typeof SIK.InteractionManager);
        
        if (SIK.InteractionManager) {
            print("Available InteractionManager methods:");
            for (var prop in SIK.InteractionManager) {
                print("  - " + prop + ": " + typeof SIK.InteractionManager[prop]);
            }
        }
    }
    
    print("interactionManager: " + typeof interactionManager);
    if (interactionManager) {
        print("Available interactionManager methods:");
        for (var prop in interactionManager) {
            print("  - " + prop + ": " + typeof interactionManager[prop]);
        }
    }
    
    print("InteractorInputType: " + typeof interactorInputType);
    print("InteractionConfiguration: " + typeof interactionConfiguration);
    print("=== End Check ===");
}

// Run availability check first
checkSIKAvailability();

// Initialize the system
initialize();
