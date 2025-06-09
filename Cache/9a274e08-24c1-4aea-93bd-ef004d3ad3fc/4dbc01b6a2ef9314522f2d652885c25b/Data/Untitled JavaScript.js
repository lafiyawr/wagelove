import { SessionController } from "SpectacleSyncKit/Core/SessionController";
import { SurfaceDetection } from './SurfaceDetection';

@component
export class MultiplayerSurfaceManager extends BaseScriptComponent {

    @input
    @allowUndefined
    surfaceDetection: SurfaceDetection

    @input
    @allowUndefined
    syncedObject: SceneObject // The object with SyncTransform component

    @input
    @allowUndefined
    startButton: SceneObject // Optional: UI button to start surface detection

    private sessionController: SessionController;
    private isFirstPlayer = false;
    private surfacePlaced = false;
    private isReady = false;

    onAwake() {
        // Get SessionController instance
        this.sessionController = SessionController.getInstance();
        
        // Set up global callback for surface detection completion
        (global as any).onSurfaceTrackingPlaced = () => {
            this.onSurfaceTrackingComplete();
        };

        // Wait for session to be ready before determining first player
        this.sessionController.notifyOnReady(() => {
            this.onSessionReady();
        });

        // Optional: Set up start button
        if (this.startButton) {
            const touchComponent = this.startButton.getComponent("Component.TouchComponent");
            if (touchComponent) {
                touchComponent.onTouchStart.add(() => {
                    this.startSurfaceDetection();
                });
            }
        }
    }

    private onSessionReady() {
        this.isReady = true;
        print("MultiplayerSurfaceManager: Session is ready");
        
        // Determine if this user is the first player
        this.determineFirstPlayer();
        
        // Auto-start surface detection if this is the first player
        if (this.isFirstPlayer) {
            // Small delay to ensure everything is initialized
            this.createEvent("DelayedCallbackEvent").bind((eventData) => {
                this.startSurfaceDetection();
            }).trigger(0.5);
        } else {
            print("MultiplayerSurfaceManager: Waiting for first player to place surface...");
            this.showWaitingUI();
        }
    }

    private determineFirstPlayer() {
        if (!this.isReady) {
            print("MultiplayerSurfaceManager: Session not ready yet");
            return;
        }

        const users = this.sessionController.getUsers();
        const localConnectionId = this.sessionController.getLocalConnectionId();
        
        print("MultiplayerSurfaceManager: Total users in session: " + users.length);
        print("MultiplayerSurfaceManager: Local connection ID: " + localConnectionId);

        if (users.length === 0) {
            print("MultiplayerSurfaceManager: No users found, defaulting to first player");
            this.isFirstPlayer = true;
            return;
        }

        // Sort users by connection ID to get consistent first player across all clients
        // This ensures the same user is always considered "first" regardless of join order perception
        const sortedUsers = users.sort((a, b) => {
            return a.connectionId.localeCompare(b.connectionId);
        });

        const firstPlayerConnectionId = sortedUsers[0].connectionId;
        this.isFirstPlayer = (localConnectionId === firstPlayerConnectionId);

        print("MultiplayerSurfaceManager: First player connection ID: " + firstPlayerConnectionId);
        print("MultiplayerSurfaceManager: Am I the first player? " + this.isFirstPlayer);

        // Log all users for debugging
        users.forEach((user, index) => {
            print(`User ${index}: ${user.displayName} (${user.connectionId})`);
        });
    }

    private startSurfaceDetection() {
        if (!this.isReady) {
            print("MultiplayerSurfaceManager: Cannot start - session not ready");
            return;
        }

        if (!this.isFirstPlayer) {
            print("MultiplayerSurfaceManager: Cannot start - not the first player");
            return;
        }

        if (this.surfacePlaced) {
            print("MultiplayerSurfaceManager: Surface already placed");
            return;
        }

        if (!this.surfaceDetection) {
            print("MultiplayerSurfaceManager: No SurfaceDetection component assigned");
            return;
        }

        print("MultiplayerSurfaceManager: Starting surface detection as first player");
        
        // Hide start button if it exists
        if (this.startButton) {
            this.startButton.enabled = false;
        }

        // Start the surface detection calibration
        this.surfaceDetection.startGroundCalibration((position, rotation) => {
            print("MultiplayerSurfaceManager: Surface detection callback triggered");
            print("Position: " + position.toString());
            print("Rotation: " + rotation.toString());
        });
    }

    private onSurfaceTrackingComplete() {
        print("MultiplayerSurfaceManager: Surface tracking placement complete!");
        
        this.surfacePlaced = true;
        
        if (this.isFirstPlayer) {
            print("MultiplayerSurfaceManager: First player successfully placed surface");
            this.showSuccessUI();
        } else {
            print("MultiplayerSurfaceManager: Received synced surface placement");
            this.showSyncedUI();
        }

        // Optional: Enable gameplay elements now that surface is placed
        this.enableGameplayElements();
    }

    private showWaitingUI() {
        // Show UI indicating waiting for first player
        print("MultiplayerSurfaceManager: Showing waiting UI");
        // Add your UI logic here
    }

    private showSuccessUI() {
        // Show UI indicating successful surface placement
        print("MultiplayerSurfaceManager: Showing success UI");
        // Add your UI logic here
    }

    private showSyncedUI() {
        // Show UI indicating surface was synced from another player
        print("MultiplayerSurfaceManager: Showing synced UI");
        // Add your UI logic here
    }

    private enableGameplayElements() {
        // Enable any gameplay elements that depend on surface placement
        print("MultiplayerSurfaceManager: Enabling gameplay elements");
        
        // Example: Enable other game objects that were waiting for surface placement
        if (this.syncedObject) {
            this.syncedObject.enabled = true;
        }
    }

    // Public method to manually trigger surface detection (useful for debugging)
    public manualStartSurfaceDetection() {
        if (this.isFirstPlayer) {
            this.startSurfaceDetection();
        } else {
            print("MultiplayerSurfaceManager: Manual start denied - not first player");
        }
    }

    // Public method to check if surface is placed
    public isSurfacePlaced(): boolean {
        return this.surfacePlaced;
    }

    // Public method to check if this is the first player
    public getIsFirstPlayer(): boolean {
        return this.isFirstPlayer;
    }
}