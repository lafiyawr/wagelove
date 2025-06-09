function handleRiseCommand() {
    print("🔥 RISE COMMAND TRIGGERED! 🔥");
    
    if(isRiseTriggered){
        print("Checking global.sendAncestorsRise...");
        print("Type of global.sendAncestorsRise:", typeof global.sendAncestorsRise);
        print("Function exists:", typeof global.sendAncestorsRise === 'function');
        
        if (typeof global.sendAncestorsRise === 'function') {
            print("Calling global.sendAncestorsRise()");
            global.sendAncestorsRise();
            isRiseTriggered = false;
        } else {
            print("ERROR: global.sendAncestorsRise function not found!");
            // List all global functions for debugging
            var globalFuncs = [];
            for (var key in global) {
                if (typeof global[key] === 'function') {
                    globalFuncs.push(key);
                }
            }
            print("Available global functions:", globalFuncs.join(", "));
        }
    }
}