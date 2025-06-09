"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.StartMenu = void 0;
var __selfType = requireType("./StartMenu");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const SessionController_1 = require("../Core/SessionController");
const SyncKitLogger_1 = require("./SyncKitLogger");
const TAG = "StartMenu";
let StartMenu = class StartMenu extends BaseScriptComponent {
    onStart() {
        // Re-enable the start menu if the connection fails
        SessionController_1.SessionController.getInstance().onConnectionFailed.add(() => {
            this.getSceneObject().enabled = true;
            this.setStartMenuInFrontOfUser();
        });
        // Skip the start menu if the lens was launched directly as multiplayer
        this.checkIfStartedAsMultiplayer();
        this.setStartMenuInFrontOfUser();
        this.singlePlayerButton.onButtonPinched.add(() => this.onSinglePlayerPress());
        this.multiPlayerButton.onButtonPinched.add(() => this.startMultiplayerSession());
    }
    /**
     * If the systemUI has requested that the lens launch directly into multiplayer mode,
     * immediately dismiss this menu and initialize the Spectacles Sync Kit.
     */
    checkIfStartedAsMultiplayer() {
        const shouldStartMultiplayer = global.launchParams.getBool("StartMultiplayer");
        this.log.i(`Lens started as multiplayer: ${shouldStartMultiplayer}`);
        if (shouldStartMultiplayer) {
            this.startMultiplayerSession();
        }
    }
    /**
     * Start the game in single player mode by hiding this menu.
     */
    onSinglePlayerPress() {
        switch (this.singlePlayerType) {
            case "mocked_online":
                SessionController_1.SessionController.getInstance().prepareOfflineMode();
                this.enableOnSingleplayerNodes.forEach((node) => {
                    node.enabled = true;
                });
                this.startMultiplayerSession();
                break;
            case "manual":
            default:
                this.enableOnSingleplayerNodes.forEach((node) => {
                    node.enabled = true;
                });
                // Call the Game Manager's single player function
                if (global.startSinglePlayerWrapper) {
                    global.startSinglePlayerWrapper();
                }
                else {
                    this.log.w("Game Manager not ready - falling back to original behavior");
                    this.getSceneObject().enabled = false;
                }
                break;
        }
    }
    /**
     * Start the session by initializing the Spectacles Sync Kit, and hiding this menu.
     */
    startMultiplayerSession() {
        this.log.i("Starting session");
        // Initialize the session controller first
        SessionController_1.SessionController.getInstance().init();
        // Wait a moment for the session to initialize, then call Game Manager
        const delayedEvent = this.createEvent("DelayedCallbackEvent");
        delayedEvent.bind(() => {
            if (global.startMultiplayerWrapper) {
                global.startMultiplayerWrapper();
            }
            else {
                this.log.w("Game Manager not ready - falling back to original behavior");
            }
        });
        delayedEvent.reset(0.5);
        // Hide the menu
        this.getSceneObject().enabled = false;
    }
    setStartMenuInFrontOfUser() {
        const head = this.worldCamera.getTransform().getWorldPosition();
        const forward = this.worldCamera.getTransform().forward;
        forward.y = 0;
        const pos = forward.normalize().uniformScale(-this.startMenuDistanceFromUser);
        this.startMenuTransform.setWorldPosition(head.add(pos));
        this.startMenuTransform.setWorldRotation(quat.lookAt(pos.uniformScale(-1), vec3.up()));
    }
    __initialize() {
        super.__initialize();
        this.log = new SyncKitLogger_1.SyncKitLogger(TAG);
        this.worldCamera = WorldCameraFinderProvider_1.default.getInstance();
        this.startMenuTransform = this.sceneObject.getTransform();
        this.createEvent("OnStartEvent").bind(() => this.onStart());
    }
};
exports.StartMenu = StartMenu;
exports.StartMenu = StartMenu = __decorate([
    component
], StartMenu);
//# sourceMappingURL=StartMenu.js.map