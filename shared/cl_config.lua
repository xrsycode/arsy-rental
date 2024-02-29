Config = {}

MenuRental = {
    apartment = {
        label = "Rental Sepeda",
        kendaraan = {{
            model = 'bmx',
            harga = 1000,
            label = 'BMX'
        }, {
            model = 'bmx',
            harga = 1000,
            label = 'BMX'
        }}
    },
    legionsquare = {
        label = "Rental Sepeda",
        kendaraan = {{
            model = 'bmx',
            harga = 1000,
            label = 'BMX'
        }, {
            model = 'bmx',
            harga = 1000,
            label = 'BMX'
        }}
    },
}

LokasiRental = {
    {
        KordinatPed = vector4(-296.17, -993.09, 30.08, 341.58),
        SpawnKendaraan =  vector4(-297.78, -990.55, 30.47, 339.22),
        model = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',

        menu = 'apartment',

        blip = {
            show = true,
            label = "Vehicle rental",
            coords = vector3(-296.17, -993.09, 31.08),
            sprite = 782,
            color = 0,
            scale = 0.7,
        }
    },
    {
        KordinatPed = vector4(173.46, -1001.83, 28.34, 170.97),
        SpawnKendaraan =  vector4(174.48, -1011.7, 28.67, 205.16),
        model = 'mp_m_waremech_01',
        scenario = 'WORLD_HUMAN_CLIPBOARD',

        menu = 'legionsquare',

        blip = {
            show = true,
            label = "Rental Sepeda",
            coords = vector3(173.46, -1001.83, 29.34),
            sprite = 782,
            color = 0,
            scale = 0.7,
        }
    },
}