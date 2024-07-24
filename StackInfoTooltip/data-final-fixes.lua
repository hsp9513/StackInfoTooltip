-- data
local DEBUG_MODE = true

function debug(str) 
    if DEBUG_MODE then
        log(str)
    end
end

local entity_types = {
    "accumulator",
    "artillery-turret",
    "beacon",
    "boiler",
    "burner-generator",
    "character",
    "arithmetic-combinator",
    "decider-combinator",
    "constant-combinator",
    "container",
    "logistic-container",
    "infinity-container",
    "assembling-machine",
    "rocket-silo",
    "furnace",
    "electric-energy-interface",
    "electric-pole",
    "unit-spawner",
    "combat-robot",
    "construction-robot",
    "logistic-robot",
    "gate",
    "generator",
    "heat-interface",
    "heat-pipe",
    "inserter",
    "lab",
    "lamp",
    "land-mine",
    "linked-container",
    "market",
    "mining-drill",
    "offshore-pump",
    "pipe",
    "infinity-pipe",
    "pipe-to-ground",
    "player-port",
    "power-switch",
    "programmable-speaker",
    "pump",
    "radar",
    "curved-rail",
    "straight-rail",
    "rail-chain-signal",
    "rail-signal",
    "reactor",
    "roboport",
    "simple-entity-with-owner",
    "simple-entity-with-force",
    "solar-panel",
    "storage-tank",
    "train-stop",
    "linked-belt",
    "loader-1x1",
    "loader",
    "splitter",
    "transport-belt",
    "underground-belt",
    "turret",
    "ammo-turret",
    "electric-turret",
    "fluid-turret",
    "unit",
    "car",
    "artillery-wagon",
    "cargo-wagon",
    "fluid-wagon",
    "locomotive",
    "spider-vehicle",
    "wall",
    "fish",
    "simple-entity",
    "spider-leg",
    "tree",
}
for _,entity_type in pairs(entity_types) do 
    debug(entity_type)
    for _,entity in pairs(data.raw[entity_type]) do 
        --debug(entity.name)
        local item = data.raw["item"][entity.name]
        if item and item.place_result==entity.name and not item.localised_description then
            item.localised_description = entity.localised_description
        end
    end
end

local item_types = {
    "item",
    "ammo",
    "capsule",
    "gun",
    "item-with-entity-data",
    "item-with-label",
    "item-with-inventory",
    "blueprint-book",
    "item-with-tags",
    "selection-tool",
    "blueprint",
    "copy-paste-tool",
    "deconstruction-item",
    "upgrade-item",
    "module",
    "rail-planner",
    "spidertron-remote",
    "tool",
    "armor",
    "repair-tool",
}

for _,item_type in pairs(item_types) do 
    debug(item_type)
    for _,item in pairs(data.raw[item_type]) do 
        local stackInfo = {"description.stack-info",item.stack_size}

        local description = 
            item.localised_description 
            or {"entity-description."..item.name} 
            or {"item-description."..item.name}
        if description then
            --description = {"", stackInfo,"\n",description}
            --description = {"", description,"\n",stackInfo}
            description = {"", {"?",{"",description,"\n"},""},stackInfo}
        else
            description = stackInfo
        end

        item.localised_description = description
    end
end

--[[
Prototype/Accumulator                  accumulator
Prototype/ArtilleryTurret              artillery-turret
Prototype/Beacon                       beacon
Prototype/Boiler                       boiler
Prototype/BurnerGenerator              burner-generator
Prototype/Character                    character
Prototype/ArithmeticCombinator         arithmetic-combinator
Prototype/DeciderCombinator            decider-combinator
Prototype/ConstantCombinator           constant-combinator
Prototype/Container                    container
Prototype/LogisticContainer            logistic-container
Prototype/InfinityContainer            infinity-container
Prototype/AssemblingMachine            assembling-machine
Prototype/RocketSilo                   rocket-silo
Prototype/Furnace                      furnace
Prototype/ElectricEnergyInterface      electric-energy-interface
Prototype/ElectricPole                 electric-pole
Prototype/EnemySpawner                 unit-spawner
Prototype/CombatRobot                  combat-robot
Prototype/ConstructionRobot            construction-robot
Prototype/LogisticRobot                logistic-robot
Prototype/Gate                         gate
Prototype/Generator                    generator
Prototype/HeatInterface                heat-interface
Prototype/HeatPipe                     heat-pipe
Prototype/Inserter                     inserter
Prototype/Lab                          lab
Prototype/Lamp                         lamp
Prototype/LandMine                     land-mine
Prototype/LinkedContainer              linked-container
Prototype/Market                       market
Prototype/MiningDrill                  mining-drill
Prototype/OffshorePump                 offshore-pump
Prototype/Pipe                         pipe
Prototype/InfinityPipe                 infinity-pipe
Prototype/PipeToGround                 pipe-to-ground
Prototype/PlayerPort                   player-port
Prototype/PowerSwitch                  power-switch
Prototype/ProgrammableSpeaker          programmable-speaker
Prototype/Pump                         pump
Prototype/Radar                        radar
Prototype/CurvedRail                   curved-rail
Prototype/StraightRail                 straight-rail
Prototype/RailChainSignal              rail-chain-signal
Prototype/RailSignal                   rail-signal
Prototype/Reactor                      reactor
Prototype/Roboport                     roboport
Prototype/SimpleEntityWithOwner        simple-entity-with-owner
Prototype/SimpleEntityWithForce        simple-entity-with-force
Prototype/SolarPanel                   solar-panel
Prototype/StorageTank                  storage-tank
Prototype/TrainStop                    train-stop
Prototype/LinkedBelt                   linked-belt
Prototype/Loader1x1                    loader-1x1
Prototype/Loader1x2                    loader
Prototype/Splitter                     splitter
Prototype/TransportBelt                transport-belt
Prototype/UndergroundBelt              underground-belt
Prototype/Turret                       turret
Prototype/AmmoTurret                   ammo-turret
Prototype/ElectricTurret               electric-turret
Prototype/FluidTurret                  fluid-turret
Prototype/Unit                         unit
Prototype/Car                          car
Prototype/ArtilleryWagon               artillery-wagon
Prototype/CargoWagon                   cargo-wagon
Prototype/FluidWagon                   fluid-wagon
Prototype/Locomotive                   locomotive
Prototype/SpiderVehicle                spider-vehicle
Prototype/Wall                         wall
Prototype/Fish                         fish
Prototype/SimpleEntity                 simple-entity
Prototype/SpiderLeg                    spider-leg
Prototype/Tree                         tree
]]
--[[
Prototype/Entity                       entity
Prototype/Arrow                        arrow
Prototype/ArtilleryFlare               artillery-flare
Prototype/ArtilleryProjectile          artillery-projectile
Prototype/Beam                         beam
Prototype/CharacterCorpse              character-corpse
Prototype/Cliff                        cliff
Prototype/Corpse                       corpse
Prototype/RailRemnants                 rail-remnants
Prototype/DeconstructibleTileProxy     deconstructible-tile-proxy
Prototype/EntityGhost                  entity-ghost
Prototype/EntityParticle               particle (for migration, cannot be used)
Prototype/LeafParticle                 leaf-particle (for migration, cannot be used)
Prototype/EntityWithHealth             <abstract>
Prototype/EntityWithOwner              <abstract>
Prototype/Combinator                   <abstract>
Prototype/CraftingMachine              <abstract>
Prototype/FlyingRobot                  <abstract>
Prototype/RobotWithLogisticInterface   <abstract>
Prototype/Rail                         <abstract>
Prototype/RailSignalBase               <abstract>
Prototype/TransportBeltConnectable     <abstract>
Prototype/Vehicle                      <abstract>
Prototype/RollingStock                 <abstract>
Prototype/Explosion                    explosion
Prototype/FlameThrowerExplosion        flame-thrower-explosion
Prototype/FireFlame                    fire
Prototype/FluidStream                  stream
Prototype/FlyingText                   flying-text
Prototype/HighlightBoxEntity           highlight-box
Prototype/ItemEntity                   item-entity
Prototype/ItemRequestProxy             item-request-proxy
Prototype/ParticleSource               particle-source
Prototype/Projectile                   projectile
Prototype/ResourceEntity               resource
Prototype/RocketSiloRocket             rocket-silo-rocket
Prototype/RocketSiloRocketShadow       rocket-silo-rocket-shadow
Prototype/Smoke                        <abstract>
Prototype/SimpleSmoke                  smoke (for migration, cannot be used)
Prototype/SmokeWithTrigger             smoke-with-trigger
Prototype/SpeechBubble                 speech-bubble
Prototype/Sticker                      sticker
Prototype/TileGhost                    tile-ghost
]]
