// Require SIK modules
const SIK = require('SpectaclesInteractionKit.lspkg/SIK').SIK;
const interactionManager = SIK.InteractionManager;
const interactorInputType = require('SpectaclesInteractionKit.lspkg/Core/Interactor/Interactor').InteractorInputType;
const interactionConfiguration = SIK.InteractionConfiguration;

// @input Component.Text statusText {"hint":"Text component to show pinch status"}

var leftHandInteractor;
var rightHandInteractor;
var isInitialized = false;

function onAwake() {
    script.createEvent('OnStartEvent').bind(() => {
        onStart();
    });
    
    script.createEvent('UpdateEvent').bind(() => {
        onUpdate();
    });
}

function onStart() {
    try {
        // Get hand interactors using the correct SIK API
        leftHandInteractor = interactionManager.getInteractorsByType(interactorInputType.LeftHand)[0];
        rightHandInteractor = interactionManager.getInteractorsByType(interactorInputType.RightHand)[0];
        
        if (leftHandInteractor) {
            print("✓ Left hand interactor found!");
        }
        if (rightHandInteractor) {
            print("✓ Right hand interactor found!");
        }
        
        isInitialized = true;
        updateStatus("SIK hand tracking ready!");
        print("✓ SIK pinch detection initialized successfully");
        
    } catch (error) {
        print("Error initializing SIK hand tracking: " + error);
        updateStatus("SIK initialization failed");
    }
}

function onUpdate() {
    if (!isInitialized) return;
    
    // Check both hands for pinch gestures
    checkHandForPinch(leftHandInteractor, "Left");
    checkHandForPinch(rightHandInteractor, "Right");
}

function checkHandForPinch(handInteractor, handSide) {
    if (!handInteractor) return;
    
    try {
        // Check if the hand interactor has pinch-related properties
        // Let's first explore what properties are available
        if (!handInteractor._propertiesLogged) {
            print("=== " + handSide + " Hand Interactor Properties ===");
            for (var prop in handInteractor) {
                var propType = typeof handInteractor[prop];
                if (propType === 'function' || propType === 'object' || propType === 'number' || propType === 'boolean') {
                    print("  " + prop + ": " + propType);
                }
            }
            handInteractor._propertiesLogged = true;
        }
        
        // Try common pinch-related property names
        var pinchProperties = ['pinchStrength', 'isPinching', 'pinch', 'gestureStrength', 'strength'];
        var pinchValue = null;
        var pinchProperty = null;
        
        for (var i = 0; i < pinchProperties.length; i++) {
            var prop = pinchProperties[i];
            if (handInteractor[prop] !== undefined) {
                pinchValue = handInteractor[prop];
                pinchProperty = prop;
                break;
            }
        }
        
        if (pinchValue !== null) {
            // Store previous state
            var wasStrongPinch = handInteractor._wasStrongPinch || false;
            var currentStrength = (typeof pinchValue === 'boolean') ? (pinchValue ? 1.0 : 0.0) : pinchValue;
            
            // Detect pinch start
            if (currentStrength > 0.7 && !wasStrongPinch) {
                onPinchDetected(handInteractor, handSide, currentStrength);
                handInteractor._wasStrongPinch = true;
            }
            // Detect pinch end
            else if (currentStrength < 0.3 && wasStrongPinch) {
                onPinchReleased(handInteractor, handSide);
                handInteractor._wasStrongPinch = false;
            }
            
            // Show real-time strength
            if (currentStrength > 0.1) {
                updateStatus(handSide + " " + pinchProperty + ": " + currentStrength.toFixed(2));
            }
        } else {
            // If no pinch properties found, try to detect through position changes
            checkPositionBasedPinch(handInteractor, handSide);
        }
        
    } catch (error) {
        print("Error checking " + handSide + " hand: " + error);
    }
}

function checkPositionBasedPinch(handInteractor, handSide) {
    // Try to detect pinch through rapid position changes or other indicators
    try {
        if (handInteractor.startPoint) {
            var currentPos = handInteractor.startPoint;
            var prevPos = handInteractor._prevPosition;
            
            if (prevPos) {
                var distance = currentPos.distance(prevPos);
                // If hand suddenly stops moving (potential pinch)
                if (distance < 0.01 && !handInteractor._wasStill) {
                    // Potential pinch detected through stillness
                    print(handSide + " hand became still - potential pinch");
                    handInteractor._wasStill = true;
                } else if (distance > 0.01) {
                    handInteractor._wasStill = false;
                }
            }
            
            handInteractor._prevPosition = currentPos;
        }
    } catch (error) {
        print("Error in position-based pinch detection: " + error);
    }
}

function onPinchDetected(handInteractor, handSide, strength) {
    print("🤏 " + handSide + " PINCH DETECTED!");
    print("   Strength: " + strength.toFixed(2));
    
    if (handInteractor.startPoint) {
        var pinchPos = handInteractor.startPoint;
        print("   Position: (" + pinchPos.x.toFixed(2) + ", " + pinchPos.y.toFixed(2) + ", " + pinchPos.z.toFixed(2) + ")");
        
        updateStatus(handSide + " PINCH! 🤏");
        
        // This is where you would trigger your particle pop effect!
        print("   -> Ready for particle pop effect at position: " + pinchPos.toString());
        
        // Call particle pop function here
        triggerParticlePop(pinchPos, strength);
    }
}

function onPinchReleased(handInteractor, handSide) {
    print("👋 " + handSide + " pinch released");
    updateStatus(handSide + " released");
}

function triggerParticlePop(position, strength) {
    // This is where you'll integrate with your particle system
    print("🎆 PARTICLE POP at " + position.toString() + " with strength " + strength.toFixed(2));
    
    // Example of what you might do:
    // - Pass position to your shader as popPosition
    // - Pass strength to control pop intensity
    // - Trigger particle burst effect
}

function updateStatus(message) {
    if (script.statusText) {
        script.statusText.text = message;
    }
}

// Start the system
onAwake();