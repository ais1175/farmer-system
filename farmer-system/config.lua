Config = {}

Config.SkillCheckTypes = {'medium', 'easy'} -- THE MINIGAME (EASY, MEDIUM, HARD)

-- Locale for different actions and messages
Config.Locale = {
    ['utils'] = 'Sell',
    ['collectmilk'] = 'Collect milk',
    ['collectstrawberries'] = 'Collect strawberries',
    ['inventoryfull'] = 'Your inventory is full!',
    ['failed'] = 'You failed, try again!',
}

-- Cows configuration (for collecting milk)
Config.CowsConfiguration = {
    ['CowModel'] = 'a_c_cow',
    ['Locations'] = {
        { ['x'] = 370.0004, ['y'] = 6482.6006, ['z'] = 28.43542, ['heading'] = 150.9857 }, -- 370.0004, 6482.6006, 29.4102, 281.4329
        { ['x'] = 379.3206, ['y'] = 6475.6133, ['z'] = 28.54845, ['heading'] = 199.5876 }, -- 379.3206, 6475.6133, 29.7777, 303.5723
        { ['x'] = 370.6938, ['y'] = 6467.8398, ['z'] = 28.93196, ['heading'] = 186.0277 } -- 370.6938, 6467.8398, 30.2298, 140.5347
    }
}

-- Product prices for selling farm goods
Config.Prices = {
    milk = 50,
    strawberries = 30,
}

-- Ped configuration for the NPC at the selling point
Config.PedModel = 'a_f_m_bevhills_01'
Config.PedLocation = vector3(406.3308, 6497.4805, 26.8251)
Config.PedHeading = 135.8008
