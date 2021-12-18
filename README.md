# qb-bikerental

Rent bikes using qb-target and nh-context/qb-menu,
converted from [Night_bikes](https://github.com/nighmares/Night_bikes)

(first convert ever, pls go easy on me)


Dependencies:
* [qb-core](https://github.com/qbcore-framework/qb-core)
* [qb-target](https://github.com/BerkieBb/qb-target)
* [nh-context](https://github.com/nerohiro/nh-context) or [qb-menu](https://github.com/qbcore-framework/qb-menu)
* [Electric Sharing Scooter](https://www.gta5-mods.com/vehicles/portuguese-electric-sharing-scooter-addon-livery-map-editor-xml) (already added in the stream folder, updated meta files)

set the price for the bikes in the config (default: $150)


Add to qb-target under Config.Peds (DON'T FORGET TO FILL IN THAT NUMBER):
```
    [<ADD NUMBER HERE>] = {
        model = 'ig_maryann',
        coords = vector4(-208.46, -1010.08, 29.19, 72.95), -- Alta St
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_MUSCLE_FLEX'
        target = {
            options = {
                {
                    type = "client",
                    event = "qb-bikerental:rented",
                    icon = "fas fa-bicycle",
                    label = "Rent a Bike",
                },
            },
            distance = 3.0
        },
    },
```

If you're using qb-menu instead of nh-context, replace the TriggerEvent to open/create the menu
In older versions of nh-context it's `'nh-context:sendMenu'`, in newer versions it should be `'nh-context:createMenu'`
In qb-menu it's `'qb-menu:client:openMenu'`


## TODO
* ~add vehicles to config~
* ~add custom price per vehicle~ -> tried, breaks a lot of things :/
* update to latest version of ~~nh-context and~~ qb-menu
