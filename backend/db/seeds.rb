# frozen_string_literal: true

# Create admin
User.create(email: 'admin@gmail.com', password: 'Admin123!', password_confirmation: 'Admin123!',
            role: :admin, first_name: 'Tuyết', last_name: 'Lê', mobile: '0378114033',
            address: 'Quảng Ngãi')

# Create repair equipments
re1 = RepairEquipment.create(name: 'Thiết bị điện',
                             description: 'Các thiết bị điện như là Cầu giao, Cầu chì, Công tắc, Đèn điện, Ổ cắm...')
re1.photo.attach(io: File.open(Rails.root.join('public/images/dien.jpg')), filename: 'dien.jpg')

re2 = RepairEquipment.create(name: 'Thiết bị nước',
                             description: 'Các thiết bị nước như là Hệ thống lọc nước, Van nước, Vòi nước...')
re2.photo.attach(io: File.open(Rails.root.join('public/images/nuoc.jpg')), filename: 'nuoc.jpg')

re3 = RepairEquipment.create(name: 'Máy tính xách tay Laptop',
                             description: 'Các hãng laptop như Dell, Asus, HP, Macbook, Lenovo, MSI, LG...')
re3.photo.attach(io: File.open(Rails.root.join('public/images/laptop.jpg')), filename: 'laptop.jpg')

re4 = RepairEquipment.create(name: 'Máy tính để bàn PC',
                             description: 'Các hãng PC như Dell, Asus, HP, Apple, Acer, Razor, Lenovo, Samsung, MSI...')
re4.photo.attach(io: File.open(Rails.root.join('public/images/pc.jpg')), filename: 'pc.jpg')

re5 = RepairEquipment.create(name: 'Điện thoại',
                             description: 'Các hãng điện thoại như Apple, Samsung, Xiaomi, Oppo, Vivo, Nokia...')
re5.photo.attach(io: File.open(Rails.root.join('public/images/telephone.jpg')), filename: 'telephone.jpg')

re6 = RepairEquipment.create(name: 'Điều hoà',
                             description: 'Các hãng điều hoà như LG, Panasonic, Daikin, Mitsubishi...')
re6.photo.attach(io: File.open(Rails.root.join('public/images/ac.jpg')), filename: 'ac.jpg')

re7 = RepairEquipment.create(name: 'Máy giặt',
                             description: 'Các hãng máy giặt như Toshiba, Panasonic, LG, Hitachi...')
re7.photo.attach(io: File.open(Rails.root.join('public/images/may_giat.jpg')), filename: 'may_giat.jpg')

re8 = RepairEquipment.create(name: 'Quạt điện',
                             description: 'Các hãng quạt điện như Asia, Panasonic, Senko...')
re8.photo.attach(io: File.open(Rails.root.join('public/images/quat.jpg')), filename: 'quat.jpg')

re9 = RepairEquipment.create(name: 'Bếp lửa',
                             description: 'Các thiết bị liên quan như bếp lửa hoặc rò rỉ gas...')
re9.photo.attach(io: File.open(Rails.root.join('public/images/bep_lua.jpg')), filename: 'bep_lua.jpg')

re10 = RepairEquipment.create(name: 'Thiết bị Camera',
                              description: 'Các hãng camera như KBVISION, Questek, HIKVISION...')
re10.photo.attach(io: File.open(Rails.root.join('public/images/camera.jpg')), filename: 'camera.jpg')

re11 = RepairEquipment.create(name: 'Thiết bị âm thanh',
                              description: 'Các hãng loa như Marshall, JBL, Sony...')
re11.photo.attach(io: File.open(Rails.root.join('public/images/loa.jpg')), filename: 'loa.jpg')

re12 = RepairEquipment.create(name: 'Tivi',
                              description: 'Các hãng TV như Samsung, Sony, LG...')
re12.photo.attach(io: File.open(Rails.root.join('public/images/tv.jpg')), filename: 'tv.jpg')
