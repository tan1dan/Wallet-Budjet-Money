//
//  Resources.swift
//  WalletBudget&Money
//
//  Created by Иван Знак on 21/04/2024.
//

import Foundation

struct StaticData {
    static let expenses: [CategoryItem] = [
        //FoodAndDrinks
        CategoryItem(
            text: FoodAndDrinks.food,
            type: .foodAndDrinks,
            subType: SubTypes(
                foodAndDrinks: .food
            )),
        CategoryItem(
            text: FoodAndDrinks.products,
            type: .foodAndDrinks,
            subType: SubTypes(
                foodAndDrinks: .products
            )),
        CategoryItem(
            text: FoodAndDrinks.restaurants,
            type: .foodAndDrinks,
            subType: SubTypes(
                foodAndDrinks: .restaurants
            )),
        CategoryItem(
            text: FoodAndDrinks.bars,
            type: .foodAndDrinks,
            subType: SubTypes(
                foodAndDrinks: .bars
            )),
        //Buys
        CategoryItem(
            text: Buys.buys,
            type: .buys,
            subType: SubTypes(
                buys: .buys
            )
        ),
        CategoryItem(
            text: Buys.clothes,
            type: .buys,
            subType: SubTypes(
                buys: .clothes
            )
        ),
        CategoryItem(
            text: Buys.jewellery,
            type: .buys,
            subType: SubTypes(
                buys: .jewellery
            )
        ),
        CategoryItem(
            text: Buys.beauty,
            type: .buys,
            subType: SubTypes(
                buys: .beauty
            )
        ),
        CategoryItem(
            text: Buys.children,
            type: .buys,
            subType: SubTypes(
                buys: .children
            )
        ),
        CategoryItem(
            text: Buys.home,
            type: .buys,
            subType: SubTypes(
                buys: .home
            )
        ),
        CategoryItem(
            text: Buys.pets,
            type: .buys,
            subType: SubTypes(
                buys: .pets
            )
        ),
        CategoryItem(
            text: Buys.electronics,
            type: .buys,
            subType: SubTypes(
                buys: .electronics
            )
        ),
        CategoryItem(
            text: Buys.presents,
            type: .buys,
            subType: SubTypes(
                buys: .presents
            )
        ),
        CategoryItem(
            text: Buys.instruments,
            type: .buys,
            subType: SubTypes(
                buys: .instruments
            )
        ),
        CategoryItem(
            text: Buys.freeTime,
            type: .buys,
            subType: SubTypes(
                buys: .freeTime
            )
        ),
        CategoryItem(
            text: Buys.farmacy,
            type: .buys,
            subType: SubTypes(
                buys: .farmacy
            )
        ),
        //House
        CategoryItem(
            text: House.house,
            type: .house,
            subType: SubTypes(
                house: .house
            )
        ),
        CategoryItem(
            text: House.rent,
            type: .house,
            subType: SubTypes(
                house: .rent
            )
        ),
        CategoryItem(
            text: House.mortgage,
            type: .house,
            subType: SubTypes(
                house: .mortgage
            )
        ),
        CategoryItem(
            text: House.utilities,
            type: .house,
            subType: SubTypes(
                house: .utilities
            )
        ),
        CategoryItem(
            text: House.service,
            type: .house,
            subType: SubTypes(
                house: .service
            )
        ),
        CategoryItem(
            text: House.repair,
            type: .house,
            subType: SubTypes(
                house: .repair
            )
        ),
        CategoryItem(
            text: House.insurance,
            type: .house,
            subType: SubTypes(
                house: .insurance
            )
        ),
        //Transport
        CategoryItem(
            text: Transport.transport,
            type: .transport,
            subType: SubTypes(
                transport: .transport
            )
        ),
        CategoryItem(
            text: Transport.publicTransport,
            type: .transport,
            subType: SubTypes(
                transport: .publicTransport
            )
        ),
        CategoryItem(
            text: Transport.taxi,
            type: .transport,
            subType: SubTypes(
                transport: .taxi
            )
        ),
        CategoryItem(
            text: Transport.longTrips,
            type: .transport,
            subType: SubTypes(
                transport: .longTrips
            )
        ),
        CategoryItem(
            text: Transport.dealTrips,
            type: .transport,
            subType: SubTypes(
                transport: .dealTrips
            )
        ),
        //Car
        CategoryItem(
            text: Car.car,
            type: .car,
            subType: SubTypes(
                car: .car
            )
        ),
        CategoryItem(
            text: Car.fuel,
            type: .car,
            subType: SubTypes(
                car: .fuel
            )
        ),
        CategoryItem(
            text: Car.parking,
            type: .car,
            subType: SubTypes(
                car: .parking
            )
        ),
        CategoryItem(
            text: Car.techService,
            type: .car,
            subType: SubTypes(
                car: .techService
            )
        ),
        CategoryItem(
            text: Car.rent,
            type: .car,
            subType: SubTypes(
                car: .rent
            )
        ),
        CategoryItem(
            text: Car.insurance,
            type: .car,
            subType: SubTypes(
                car: .insurance
            )
        ),
        CategoryItem(
            text: Car.leasing,
            type: .car,
            subType: SubTypes(
                car: .leasing
            )
        ),
        //Relax
        CategoryItem(
            text: Relax.relax,
            type: .relax,
            subType: SubTypes(
                relax: .relax
            )
        ),
        CategoryItem(
            text: Relax.treatment,
            type: .relax,
            subType: SubTypes(
                relax: .treatment
            )
        ),
        CategoryItem(
            text: Relax.beauty,
            type: .relax,
            subType: SubTypes(
                relax: .beauty
            )
        ),
        CategoryItem(
            text: Relax.sport,
            type: .relax,
            subType: SubTypes(
                relax: .sport
            )
        ),
        CategoryItem(
            text: Relax.culture,
            type: .relax,
            subType: SubTypes(
                relax: .culture
            )
        ),
        CategoryItem(
            text: Relax.parties,
            type: .relax,
            subType: SubTypes(
                relax: .parties
            )
        ),
        CategoryItem(
            text: Relax.hobby,
            type: .relax,
            subType: SubTypes(
                relax: .hobby
            )
        ),
        CategoryItem(
            text: Relax.education,
            type: .relax,
            subType: SubTypes(
                relax: .education
            )
        ),
        CategoryItem(
            text: Relax.books,
            type: .relax,
            subType: SubTypes(
                relax: .books
            )
        ),
        CategoryItem(
            text: Relax.tv,
            type: .relax,
            subType: SubTypes(
                relax: .tv
            )
        ),
        CategoryItem(
            text: Relax.trips,
            type: .relax,
            subType: SubTypes(
                relax: .trips
            )
        ),
        CategoryItem(
            text: Relax.presents,
            type: .relax,
            subType: SubTypes(
                relax: .presents
            )
        ),
        CategoryItem(
            text: Relax.alcoholy,
            type: .relax,
            subType: SubTypes(
                relax: .alcoholy
            )
        ),
        CategoryItem(
            text: Relax.lotteries,
            type: .relax,
            subType: SubTypes(
                relax: .lotteries
            )
        ),
        //Communication
        CategoryItem(
            text: Communication.communcitaion,
            type: .communication,
            subType: SubTypes(
                communication: .communcitaion
            )
        ),
        CategoryItem(
            text: Communication.phone,
            type: .communication,
            subType: SubTypes(
                communication: .phone
            )
        ),
        CategoryItem(
            text: Communication.internet,
            type: .communication,
            subType: SubTypes(
                communication: .internet
            )
        ),
        CategoryItem(
            text: Communication.games,
            type: .communication,
            subType: SubTypes(
                communication: .games
            )
        ),
        CategoryItem(
            text: Communication.post,
            type: .communication,
            subType: SubTypes(
                communication: .post
            )
        ),
        //Finance
        CategoryItem(
            text: Finance.finance,
            type: .finance,
            subType: SubTypes(
                finance: .finance
            )
        ),
        CategoryItem(
            text: Finance.taxes,
            type: .finance,
            subType: SubTypes(
                finance: .taxes
            )
        ),
        CategoryItem(
            text: Finance.insurance,
            type: .finance,
            subType: SubTypes(
                finance: .insurance
            )
        ),
        CategoryItem(
            text: Finance.credits,
            type: .finance,
            subType: SubTypes(
                finance: .credits
            )
        ),
        CategoryItem(
            text: Finance.fine,
            type: .finance,
            subType: SubTypes(
                finance: .fine
            )
        ),
        CategoryItem(
            text: Finance.consultion,
            type: .finance,
            subType: SubTypes(
                finance: .consultion
            )
        ),
        CategoryItem(
            text: Finance.fees,
            type: .finance,
            subType: SubTypes(
                finance: .fees
            )
        ),
        CategoryItem(
            text: Finance.aliment,
            type: .finance,
            subType: SubTypes(
                finance: .aliment
            )
        ),
        //Invest
        CategoryItem(
            text: Invest.invest,
            type: .invest,
            subType: SubTypes(
                invest: .invest
            )
        ),
        CategoryItem(
            text: Invest.realEstate,
            type: .invest,
            subType: SubTypes(
                invest: .realEstate
            )
        ),
        CategoryItem(
            text: Invest.transport,
            type: .invest,
            subType: SubTypes(
                invest: .transport
            )
        ),
        CategoryItem(
            text: Invest.financeInvest,
            type: .invest,
            subType: SubTypes(
                invest: .financeInvest
            )
        ),
        CategoryItem(
            text: Invest.saving,
            type: .invest,
            subType: SubTypes(
                invest: .saving
            )
        ),
        CategoryItem(
            text: Invest.collection,
            type: .invest,
            subType: SubTypes(
                invest: .collection
            )
        )
    ]
    
    static let income: [CategoryItem] = [
        CategoryItem(
        text: Income.income,
        type: .income,
        subType: SubTypes(
            income: .income
        )),
        CategoryItem(
        text: Income.salary,
        type: .income,
        subType: SubTypes(
            income: .salary
        )),
        CategoryItem(
        text: Income.percents,
        type: .income,
        subType: SubTypes(
            income: .percents
        )),
        CategoryItem(
        text: Income.selling,
        type: .income,
        subType: SubTypes(
            income: .selling
        )),
        CategoryItem(
        text: Income.rent,
        type: .income,
        subType: SubTypes(
            income: .rent
        )),
        CategoryItem(
        text: Income.grants,
        type: .income,
        subType: SubTypes(
            income: .grants
        )),
        CategoryItem(
        text: Income.credit,
        type: .income,
        subType: SubTypes(
            income: .credit
        )),
        CategoryItem(
        text: Income.vouchers,
        type: .income,
        subType: SubTypes(
            income: .vouchers
        )),
        CategoryItem(
        text: Income.lotteries,
        type: .income,
        subType: SubTypes(
            income: .lotteries
        )),
        CategoryItem(
        text: Income.returning,
        type: .income,
        subType: SubTypes(
            income: .returning
        )),
        CategoryItem(
        text: Income.aliment,
        type: .income,
        subType: SubTypes(
            income: .aliment
        )),
        CategoryItem(
        text: Income.presents,
        type: .income,
        subType: SubTypes(
            income: .presents
        )),
    ]
}

struct CategoryItem: Hashable {
    var text: String
    var type: Types
    var subType: SubTypes
}

struct SubTypes: Hashable {
    var foodAndDrinks: FoodAndDrinksSubtypes?
    var buys: BuysSubtypes?
    var house: HouseSubtypes?
    var transport: TransportSubtypes?
    var car: CarSubtypes?
    var relax: RelaxSubtypes?
    var communication: CommunicationSubtypes?
    var finance: FinanceSubtypes?
    var invest: InvestSubtypes?
    var income: IncomeSubtypes?
}

enum Types: String, Codable, Hashable {
    case foodAndDrinks
    case buys
    case house
    case transport
    case car
    case relax
    case communication
    case finance
    case invest
    case income
}

enum FoodAndDrinksSubtypes: Hashable {
    case food
    case products
    case restaurants
    case bars
}

enum BuysSubtypes: Hashable {
    case buys
    case clothes
    case jewellery
    case beauty
    case children
    case home
    case pets
    case electronics
    case presents
    case instruments
    case freeTime
    case farmacy 
}

enum HouseSubtypes: Hashable{
    case house
    case rent
    case mortgage
    case utilities
    case service
    case repair
    case insurance
}

enum TransportSubtypes: Hashable {
    case transport
    case publicTransport
    case taxi
    case longTrips
    case dealTrips
}

enum CarSubtypes: Hashable {
    case car
    case fuel
    case parking
    case techService
    case rent
    case insurance
    case leasing
}

enum RelaxSubtypes: Hashable {
    case relax
    case treatment
    case beauty
    case sport
    case culture
    case parties
    case hobby
    case education
    case books
    case tv
    case trips
    case presents
    case alcoholy
    case lotteries
}


enum CommunicationSubtypes: Hashable {
    case communcitaion
    case phone
    case internet
    case games
    case post
}

enum FinanceSubtypes: Hashable {
    case finance
    case taxes
    case insurance
    case credits
    case fine
    case consultion
    case fees
    case aliment
}

enum InvestSubtypes: Hashable {
    case invest
    case realEstate
    case transport
    case financeInvest
    case saving
    case collection
}

enum IncomeSubtypes: Hashable {
    case income
    case salary
    case percents
    case selling
    case rent
    case grants
    case credit
    case vouchers
    case lotteries
    case returning
    case aliment
    case presents
}


enum FoodAndDrinks: Hashable {
    static let food = "Еда и напитки"
    static let products = "Продукты"
    static let restaurants = "Ресторан, фаст-фуд"
    static let bars = "Бар, кафе"
}

enum Buys: Hashable {
    static let buys = "Покупки"
    static let clothes = "Одежда и обувь"
    static let jewellery = "Украшения, аксессуары"
    static let beauty = "Красота и здоровье"
    static let children = "Дети"
    static let home = "Дом и сад"
    static let pets = "Домашние животные"
    static let electronics = "Электроиника, аксессуары"
    static let presents = "Подарки"
    static let instruments = "Инструменты"
    static let freeTime = "Свободное время"
    static let farmacy = "Аптека"
}

enum House: Hashable{
    static let house = "Жилье"
    static let rent = "Аренда"
    static let mortgage = "Ипотека"
    static let utilities = "Электричество, коммунальные услуги"
    static let service = "Услуги"
    static let repair = "Ремонт"
    static let insurance = "Страхование имущества"
}

enum Transport: Hashable {
    static let transport = "Транспорт"
    static let publicTransport = "Общественный транспорт"
    static let taxi = "Такси"
    static let longTrips = "Дальние поездки"
    static let dealTrips = "Деловые поездки"
}

enum Car: Hashable {
    static let car = "Автомобиль"
    static let fuel = "Топливо"
    static let parking = "Парковка"
    static let techService = "Техобслуживание"
    static let rent = "Аренда"
    static let insurance = "Страхование автомобиля"
    static let leasing = "Лизинг"
}

enum Relax: Hashable {
    static let relax = "Развлечения и досуг"
    static let treatment = "Лечение"
    static let beauty = "Оздоровительные процедуры, красота"
    static let sport = "Спорт, Фитнес"
    static let culture = "Культура и спорт"
    static let parties = "Праздники"
    static let hobby = "Хобби"
    static let education = "Образование, развитие"
    static let books = "Книги, аудио, подписки"
    static let tv = "ТВ и вещание"
    static let trips = "Отдых, поездки, отели"
    static let presents = "Подарки и благотворительность"
    static let alcoholy = "Алкоголь, табак"
    static let lotteries = "Лотереи и азартные игры"
}


enum Communication: Hashable {
    static let communcitaion = "Связь, ПК"
    static let phone = "Телефон"
    static let internet = "Интернет"
    static let games = "Программы, игры"
    static let post = "Почтовые услуги"
}

enum Finance: Hashable {
    static let finance = "Финансовые расходы"
    static let taxes = "Налоги"
    static let insurance = "Страхование"
    static let credits = "Займы, проценты"
    static let fine = "Штрафы"
    static let consultion = "Консультация"
    static let fees = "Сборы, платы"
    static let aliment = "Алименты"
}

enum Invest: Hashable {
    static let invest = "Инвестиции"
    static let realEstate = "Недвижимость"
    static let transport = "Транспортные средства, движимое имущество"
    static let financeInvest = "Финансовые инвестиции"
    static let saving = "Сбережения"
    static let collection = "Коллекции"
}

enum Income: Hashable {
    static let income = "Доход"
    static let salary = "Зарплата, счета-фактуры"
    static let percents = "Проценты, дивиденды"
    static let selling = "Продажа"
    static let rent = "Доход от аренды"
    static let grants = "Взносы и гранты"
    static let credit = "Кредит, аренда"
    static let vouchers = "Чеки, купоны"
    static let lotteries = "Лотереи, азартные игры"
    static let returning = "Возврат денег(налог, покупка)"
    static let aliment = "Алименты"
    static let presents = "Подарки"
}

