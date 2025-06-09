// Simple Prefab Particle Spawner
// Spawns prefabs with traditional particle system controls

// @input Asset.ObjectPrefab particlePrefab {"hint":"Prefab with built-in SIK interactions"}
// @input Component.Text debugText {"hint":"Optional debug display"}

// === EMISSION SETTINGS ===
// @input int maxParticles = 100 {"hint":"Maximum particles alive at once"}
// @input float spawnRate = 10.0 {"hint":"Particles per second"}
// @input bool autoEmit = false {"hint":"Start emitting automatically"}
// @input float burstCount = 0 {"hint":"Particles to spawn in burst (0 = continuous)"}

// === VELOCITY SETTINGS ===
// @input vec3 initialVelocity = {0, 5, 0} {"hint":"Base velocity for all particles"}
// @input vec3 velocityVariation = {2, 1, 2} {"hint":"Random variation range"}
// @input float velocityInheritance = 0.0 {"hint":"How much particles inherit emitter velocity"}

// === FORCES ===
// @input vec3 gravity = {0, -9.8, 0} {"hint":"Gravity force applied to particles"}
// @input vec3 wind = {0, 0, 0} {"hint":"Constant wind force"}
// @input float drag = 0.98 {"hint":"Air resistance (0.9 = heavy drag, 0.99 = light drag)"}

// === SHAPE & DIRECTION ===
// @input string emissionShape = "Point" {"widget":"combobox", "values":[{"label":"Point", "value":"Point"}, {"label":"Sphere", "value":"Sphere"}, {"label":"Box", "value":"Box"}, {"label":"Cone", "value":"Cone"}]}
// @input float emissionRadius = 1.0 {"hint":"Radius for sphere/cone emission"}
// @input vec3 emissionSize = {2, 2, 2} {"hint":"Size for box emission"}
// @input float coneAngle = 30.0 {"hint":"Cone emission angle in degrees"}
// @input vec3 emissionDirection = {0, 1, 0} {"hint":"Primary emission direction"}

// === LIFECYCLE ===
// @input float particleLifetime = 5.0 {"hint":"How long particles live"}
// @input float lifetimeVariation = 1.0 {"hint":"Random lifetime variation"}

// === SIZE & SCALE ===
// @input float startSize = 1.0 {"hint":"Initial particle size"}
// @input float endSize = 1.0 {"hint":"Final particle size"}
// @input float sizeVariation = 0.2 {"hint":"Random size variation"}
// @input bool scaleWithVelocity = false {"hint":"Scale particles based on speed"}

var activeParticles = [];
var emitterTransform;
var emitterVelocity = new vec3(0, 0, 0);
var lastEmitterPosition;
var isEmitting = false;
var lastSpawnTime = 0;

// Internal variables (can be modified at runtime)
var currentSpawnRate;
var currentGravity;
var currentWind;
var currentDrag;

function onAwake() {
    script.createEvent('OnStartEvent').bind(() => {
        onStart();
    });
    
    script.createEvent('UpdateEvent').bind(() => {
        onUpdate();
    });
}

function onStart() {
    emitterTransform = script.getSceneObject().getTransform();
    lastEmitterPosition = emitterTransform.getWorldPosition();
    
    // Initialize internal variables with script input values
    currentSpawnRate = script.spawnRate;
    currentGravity = script.gravity;
    currentWind = script.wind;
    currentDrag = script.drag;
    
    if (script.autoEmit) {
        startEmission();
    }
    
    print("Prefab Particle Spawner initialized");
}

function onUpdate() {
    updateEmitterVelocity();
    
    if (isEmitting) {
        handleEmission();
    }
    
    updateActiveParticles();
    updateDebugInfo();
}

function updateEmitterVelocity() {
    var currentPosition = emitterTransform.getWorldPosition();
    if (lastEmitterPosition) {
        emitterVelocity = currentPosition.sub(lastEmitterPosition).scale(1.0 / getDeltaTime());
    }
    lastEmitterPosition = currentPosition;
}

function handleEmission() {
    var currentTime = getTime();
    
    if (script.burstCount > 0) {
        // Burst mode
        if (currentTime - lastSpawnTime > 1.0 / currentSpawnRate) {
            spawnBurst(script.burstCount);
            lastSpawnTime = currentTime;
        }
    } else {
        // Continuous mode
        var spawnInterval = 1.0 / currentSpawnRate;
        if (currentTime - lastSpawnTime > spawnInterval) {
            spawnParticle();
            lastSpawnTime = currentTime;
        }
    }
}

function spawnParticle() {
    // Check particle limit
    if (activeParticles.length >= script.maxParticles) {
        return null;
    }
    
    // Calculate spawn properties
    var spawnPosition = calculateSpawnPosition();
    var spawnVelocity = calculateSpawnVelocity();
    var lifetime = script.particleLifetime + (Math.random() - 0.5) * script.lifetimeVariation;
    var startSize = script.startSize + (Math.random() - 0.5) * script.sizeVariation;
    var endSize = script.endSize + (Math.random() - 0.5) * script.sizeVariation;
    
    // Instantiate prefab
    var particle = script.particlePrefab.instantiate(script.getSceneObject());
    particle.getTransform().setWorldPosition(spawnPosition);
    particle.getTransform().setLocalScale(new vec3(startSize, startSize, startSize));
    
    // Create particle data
    var particleData = {
        sceneObject: particle,
        spawnTime: getTime(),
        velocity: spawnVelocity,
        lifetime: lifetime,
        startSize: startSize,
        endSize: endSize,
        isAlive: true
    };
    
    activeParticles.push(particleData);
    
    // Set up automatic cleanup
    setupParticleCleanup(particleData);
    
    return particleData;
}

function setupParticleCleanup(particleData) {
    // Automatic destruction after lifetime
    var cleanupEvent = script.createEvent("DelayedCallbackEvent");
    cleanupEvent.bind(function() {
        destroyParticle(particleData);
    });
    cleanupEvent.reset(particleData.lifetime);
}

function destroyParticle(particleData) {
    if (!particleData.isAlive) return;
    
    particleData.isAlive = false;
    
    // Fade out animation
    var renderer = particleData.sceneObject.getComponent("Component.RenderMeshVisual");
    if (renderer && renderer.material && renderer.material.mainPass) {
        var currentColor = renderer.material.mainPass.baseColor;
        
        // Fade out over 0.5 seconds
        global.tweenManager.startTween(
            renderer.material.mainPass,
            "baseColor",
            currentColor,
            new vec4(currentColor.x, currentColor.y, currentColor.z, 0),
            0.5
        );
    }
    
    // Scale down
    global.tweenManager.startTween(
        particleData.sceneObject.getTransform(),
        "setLocalScale",
        particleData.sceneObject.getTransform().getLocalScale(),
        new vec3(0, 0, 0),
        0.5
    );
    
    // Actually destroy after animation
    var destroyEvent = script.createEvent("DelayedCallbackEvent");
    destroyEvent.bind(function() {
        if (particleData.sceneObject) {
            particleData.sceneObject.destroy();
        }
        
        // Remove from active list
        var index = activeParticles.indexOf(particleData);
        if (index > -1) {
            activeParticles.splice(index, 1);
        }
    });
    destroyEvent.reset(0.5);
}

function spawnBurst(count) {
    for (var i = 0; i < count; i++) {
        spawnParticle();
    }
}

function calculateSpawnPosition() {
    var basePos = emitterTransform.getWorldPosition();
    
    switch (script.emissionShape) {
        case "Sphere":
            var randomDir = getRandomDirection();
            var randomRadius = Math.random() * script.emissionRadius;
            return basePos.add(randomDir.scale(randomRadius));
            
        case "Box":
            var randomOffset = new vec3(
                (Math.random() - 0.5) * script.emissionSize.x,
                (Math.random() - 0.5) * script.emissionSize.y,
                (Math.random() - 0.5) * script.emissionSize.z
            );
            return basePos.add(randomOffset);
            
        case "Cone":
            var coneDir = script.emissionDirection.normalize();
            var angle = (Math.random() - 0.5) * script.coneAngle * Math.PI / 180;
            var randomRadius = Math.random() * script.emissionRadius;
            
            // Create random direction within cone
            var perpendicular = vec3.cross(coneDir, vec3.up()).normalize();
            if (perpendicular.length < 0.1) {
                perpendicular = vec3.cross(coneDir, vec3.right()).normalize();
            }
            var rotatedDir = quat.angleAxis(angle, perpendicular).multiplyVec3(coneDir);
            
            return basePos.add(rotatedDir.scale(randomRadius));
            
        default: // Point
            return basePos;
    }
}

function calculateSpawnVelocity() {
    // Base velocity
    var velocity = script.initialVelocity.add(script.emissionDirection.scale(script.initialVelocity.length));
    
    // Add variation
    var variation = new vec3(
        (Math.random() - 0.5) * script.velocityVariation.x,
        (Math.random() - 0.5) * script.velocityVariation.y,
        (Math.random() - 0.5) * script.velocityVariation.z
    );
    velocity = velocity.add(variation);
    
    // Inherit emitter velocity
    if (script.velocityInheritance > 0) {
        velocity = velocity.add(emitterVelocity.scale(script.velocityInheritance));
    }
    
    return velocity;
}

function updateActiveParticles() {
    for (var i = activeParticles.length - 1; i >= 0; i--) {
        var particle = activeParticles[i];
        
        if (!particle.isAlive || !particle.sceneObject || !particle.sceneObject.enabled) {
            activeParticles.splice(i, 1);
            continue;
        }
        
        var age = getTime() - particle.spawnTime;
        
        // Update particle physics
        updateParticlePhysics(particle, age);
        
        // Update particle scale over lifetime
        updateParticleScale(particle, age);
    }
}

function updateParticlePhysics(particle, age) {
    // Apply forces using current values instead of script inputs
    particle.velocity = particle.velocity.add(currentGravity.scale(getDeltaTime()));
    particle.velocity = particle.velocity.add(currentWind.scale(getDeltaTime()));
    
    // Apply drag
    particle.velocity = particle.velocity.scale(currentDrag);
    
    // Update position
    var currentPos = particle.sceneObject.getTransform().getWorldPosition();
    var newPos = currentPos.add(particle.velocity.scale(getDeltaTime()));
    particle.sceneObject.getTransform().setWorldPosition(newPos);
}

function updateParticleScale(particle, age) {
    var lifePercent = age / particle.lifetime;
    var currentSize = particle.startSize + (particle.endSize - particle.startSize) * lifePercent;
    
    // Scale with velocity if enabled
    if (script.scaleWithVelocity) {
        var speedMultiplier = 1.0 + particle.velocity.length * 0.1;
        currentSize *= speedMultiplier;
    }
    
    particle.sceneObject.getTransform().setLocalScale(new vec3(currentSize, currentSize, currentSize));
}

function getRandomDirection() {
    var theta = Math.random() * 2 * Math.PI;
    var phi = Math.acos(2 * Math.random() - 1);
    
    return new vec3(
        Math.sin(phi) * Math.cos(theta),
        Math.sin(phi) * Math.sin(theta),
        Math.cos(phi)
    );
}

function updateDebugInfo() {
    if (script.debugText) {
        var activeCount = activeParticles.length;
        script.debugText.text = `Active Particles: ${activeCount}/${script.maxParticles}`;
    }
}

// === PUBLIC API ===

function startEmission() {
    isEmitting = true;
    print("Started particle emission");
}

function stopEmission() {
    isEmitting = false;
    print("Stopped particle emission");
}

function burst(count) {
    spawnBurst(count || script.burstCount || 10);
}

function clear() {
    for (var i = 0; i < activeParticles.length; i++) {
        destroyParticle(activeParticles[i]);
    }
    activeParticles = [];
}

function setEmissionRate(rate) {
    currentSpawnRate = rate;
    print("Emission rate set to: " + rate);
}

function setGravity(gravity) {
    currentGravity = gravity;
    print("Gravity set to: " + gravity.toString());
}

function setWind(wind) {
    currentWind = wind;
    print("Wind set to: " + wind.toString());
}

// Expose public API
script.api = {
    start: startEmission,
    stop: stopEmission,
    burst: burst,
    clear: clear,
    setEmissionRate: setEmissionRate,
    setGravity: setGravity,
    setWind: setWind,
    getActiveCount: function() { return activeParticles.length; },
    isEmitting: function() { return isEmitting; }
};

onAwake();