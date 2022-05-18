﻿
#Область ОписаниеПеременных
#КонецОбласти

#Область ПрограммныйИнтерфейс
#КонецОбласти

#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ, Режим)

	// регистр Антропометрия
	Движения.Антропометрия.Записывать = Истина;
	Для Каждого ТекСтрокаЗамеры Из Замеры Цикл
		Движение = Движения.Антропометрия.Добавить();
		Движение.Период = Дата;
		Движение.Спортсмен = Спортсмен;
		Движение.ПВХ = ТекСтрокаЗамеры.Наименование;
		Движение.Значение = ТекСтрокаЗамеры.Значение;
	КонецЦикла;

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс
#КонецОбласти

#Область СлужебныеПроцедурыИФункции
#КонецОбласти

#Область Инициализация
#КонецОбласти