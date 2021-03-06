
#Область ОписаниеПеременных
#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЗаполнитьФормуВосстановления();
КонецПроцедуры

&НаКлиенте
Процедура ПриПовторномОткрытии()
	ЗаполнитьФормуВосстановления();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)	
	ЗаполнитьФормуВосстановления();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы
#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТаймингОтдыха

&НаКлиенте
Процедура ТаймингОтдыхаВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)

	Если Элемент.ТекущиеДанные <> Неопределено Тогда
		ТренировкаСсылка	= Элемент.ТекущиеДанные.ТренировкаСсылка;
		ПараметрыФормы 		= Новый Структура("Ключ", ТренировкаСсылка);
	
		ОткрытьФорму("Документ.Тренировка.Форма.ФормаДокумента", ПараметрыФормы);
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ТренироватьНажатие(Элемент)
	
	ФормаТренировка 			= ПолучитьФорму("Документ.Тренировка.Форма.ФормаДокумента");
	ДанныеФормыФормаТренировка 	= ФормаТренировка.Объект;
	КрайнееФИОСсылка			= ТренироватьНажатиеНаСервере();
	
	ДанныеФормыФормаТренировка.Спортсмен = КрайнееФИОСсылка;
	
	ФормаТренировка.Открыть();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Функция ТренироватьНажатиеНаСервере()
	
	КрайнееФИОСсылка = Документы.Тренировка.ПолучитьКрайнееФИО();
	Возврат КрайнееФИОСсылка;
	
КонецФункции

Процедура ЗаполнитьФормуВосстановления()

	КрайнееВремяВосстановления 	= Документы.Тренировка.ПолучитьКрайнееВремяВосстановления();

	ТЗ = ЭтаФорма.ТаймингОтдыха;
	ТЗ.Очистить();	

	ГруппаМышц = "";	
	Для Каждого Восстановление Из КрайнееВремяВосстановления Цикл
		Если ГруппаМышц <> Строка(Восстановление.ГруппаМышц) Тогда
			стрТЗ 				= ТЗ.Добавить();
			стрТЗ.Стиль 		= Строка(Восстановление.ГруппаМышц);
			стрТЗ.КакЗаголовок 	= Истина;
			ГруппаМышц 			= Строка(Восстановление.ГруппаМышц);
		КонецЕсли;
		
		стрТЗ = ТЗ.Добавить();		
		ЗаполнитьЗначенияСвойств(стрТЗ, Восстановление);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)

	Если ИмяСобытия = "ТренировкаЗаписать" Тогда 
		ЗаполнитьФормуВосстановления();
	КонецЕсли;

КонецПроцедуры

#КонецОбласти