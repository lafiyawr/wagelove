// @input Component.ScriptComponent surfaceDetection
// @input SceneObject syncedObject
// @input SceneObject startButton

// Import SessionController - correct path for JavaScript
var SessionController = require("Assets/SpectaclesSyncKit/Core/SessionController");

var sessionController;
var isFirstPlayer = false;
var surfacePlaced = false;
var isReady = false;

function onAwake() {
    // Set up global callback FIRST before anything else
    global.onSurfaceTrackingPlaced = function() {
        onSurfaceTrackingComplete();
    };
    print("MultiplayerSurfaceManager: Global callback set up");

    // Get SessionController instance
    sessionController = SessionController.getInstance();
    
    // Wait for session to be ready before determining first player
    sessionController.notifyOnReady(function() {
        onSessionReady();
    });

    // Optional: Set up start button
    if (script.startButton) {
        var touchComponent = script.startButton.getComponent("Component.TouchComponent");
        if (touchComponent) {
            touchComponent.onTouchStart.add(function() {
                startSurfaceDetection();
            });
        }
    }
}

function onSessionReady() {
    isReady = true;
    print("MultiplayerSurfaceManager: Session is ready");
    
    // Determine if this user is the first player
    determineFirstPlayer();
    
    // Auto-start surface detection if this is the first player
    if (isFirstPlayer) {
        // Small delay to ensure everything is initialized
        var delayEvent = script.createEvent("DelayedCallbackEvent");
        delayEvent.bind(function() {
            startSurfaceDetection();
        });
        delayEvent.trigger(0.5);
    } else {
        print("MultiplayerSurfaceManager: Waiting for first player to place surface...");
        showWaitingUI();
    }
}

function determineFirstPlayer() {
    if (!isReady) {
        print("MultiplayerSurfaceManager: Session not ready yet");
        return;
    }

    var users = sessionController.getUsers();
    var localConnectionId = sessionController.getLocalConnectionId();
    
    print("MultiplayerSurfaceManager: Total users in session: " + users.length);
    print("MultiplayerSurfaceManager: Local connection ID: " + localConnectionId);

    if (users.length === 0) {
        print("MultiplayerSurfaceManager: No users found, defaulting to first player");
        isFirstPlayer = true;
        return;
    }

    // Sort users by connection ID to get consistent first player across all clients
    // This ensures the same user is always considered "first" regardless of join order perception
    var sortedUsers = users.sort(function(a, b) {
        return a.connectionId.localeCompare(b.connectionId);
    });

    var firstPlayerConnectionId = sortedUsers[0].connectionId;
    isFirstPlayer = (localConnectionId === firstPlayerConnectionId);

    print("MultiplayerSurfaceManager: First player connection ID: " + firstPlayerConnectionId);
    print("MultiplayerSurfaceManager: Am I the first player? " + isFirstPlayer);

    // Log all users for debugging
    for (var i = 0; i < users.length; i++) {
        var user = users[i];
        print("User " + i + ": " + user.displayName + " (" + user.connectionId + ")");
    }
}

function startSurfaceDetection() {
    if (!isReady) {
        print("MultiplayerSurfaceManager: Cannot start - session not ready");
        return;
    }

    if (!isFirstPlayer) {
        print("MultiplayerSurfaceManager: Cannot start - not the first player");
        return;
    }

    if (surfacePlaced) {
        print("MultiplayerSurfaceManager: Surface already placed");
        return;
    }

    if (!script.surfaceDetection) {
        print("MultiplayerSurfaceManager: No SurfaceDetection component assigned");
        return;
    }

    print("MultiplayerSurfaceManager: Starting surface detection as first player");
    
    // Hide start button if it exists
    if (script.startButton) {
        script.startButton.enabled = false;
    }

    // Start the surface detection calibration
    script.surfaceDetection.api.startGroundCalibration(function(position, rotation) {
        print("MultiplayerSurfaceManager: Surface detection callback triggered");
        print("Position: " + position.toString());
        print("Rotation: " + rotation.toString());
    });
}

function onSurfaceTrackingComplete() {
    print("MultiplayerSurfaceManager: Surface tracking placement complete!");
    
    surfacePlaced = true;
    
    if (isFirstPlayer) {
        print("MultiplayerSurfaceManager: First player successfully placed surface");
        showSuccessUI();
    } else {
        print("MultiplayerSurfaceManager: Received synced surface placement");
        showSyncedUI();
    }

    // Optional: Enable gameplay elements now that surface is placed
    enableGameplayElements();
}

function showWaitingUI() {
    // Show UI indicating waiting for first player
    print("MultiplayerSurfaceManager: Showing waiting UI");
    // Add your UI logic here
}

function showSuccessUI() {
    // Show UI indicating successful surface placement
    print("MultiplayerSurfaceManager: Showing success UI");
    // Add your UI logic here
}

function showSyncedUI() {
    // Show UI indicating surface was synced from another player
    print("MultiplayerSurfaceManager: Showing synced UI");
    // Add your UI logic here
}

function enableGameplayElements() {
    // Enable any gameplay elements that depend on surface placement
    print("MultiplayerSurfaceManager: Enabling gameplay elements");
    
    // Example: Enable other game objects that were waiting for surface placement
    if (script.syncedObject) {
        script.syncedObject.enabled = true;
    }
}

// Public methods accessible via script.api
script.api.manualStartSurfaceDetection = function() {
    if (isFirstPlayer) {
        startSurfaceDetection();
    } else {
        print("MultiplayerSurfaceManager: Manual start denied - not first player");
    }
};

script.api.isSurfacePlaced = function() {
    return surfacePlaced;
};

script.api.getIsFirstPlayer = function() {
    return isFirstPlayer;
};

// Initialize the script
onAwake();