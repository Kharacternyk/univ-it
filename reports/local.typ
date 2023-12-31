#set text(
  font: "IBM Plex Sans",
  lang: "uk",
)
#set par(
  justify: true,
)
#set figure(
  supplement: "Рис.",
)
#set page(
  numbering: "1 / 1",
)
#show raw: set text(
  font: "IBM Plex Mono",
)

#align(center, [
  *Звіт до локальної фрагментальної реалізації СКБД*

  _Назар Віннічук. Група МІ-4. Варіант 3-3._
])

Програмна реалізація виконана мовою Dart.
Графічний інтерфейс побудовано за допомогою графічної бібліотеки Flutter.
Інтерфейс потенційно кросс-платформений за рахунок принципу роботи Flutter,
але тестування проводилось лише на ОС Linux.

Реалізація поділена на дві частини (пакунки мови Dart).
Пакунок `core` містить опис класів та логіки предметної області,
а саме класи `Database`, `Table`, `Column` та інші (@class),
логіку серіалізації та десеріалізації бази даних у та з формату JSON,
а також логіку обчислення різниці таблиць.
Пакунок `core` містить три unit-тести,
що перевіряють серіалізацію та десеріалізацію,
обчислення різниці таблиць,
і структурне порівняння рядків символьних інтервалів.
Пакунок `gui` містить локальний графічний застосунок,
що використовує пакунок `core` та бібліотеку Flutter.

Графічна реалізація побудована за принципом,
що користувач завжди бачить певну таблицю як поточну.
Для забезпечення цього принципу видаляти дозволяється лише не поточні таблиці,
а відкриття порожньої бази даних автоматично створює у ній таблицю.
Графічний застосунок зажди має відкриту базу даних в оперативній пам'яті,
яку можна вивантажити на диск у довільне розташування серед файлової системи,
або ж замінити на базу даних,
збережену у довільно розташованому файлі.
Усі комірки певного стовпчика таблиці мають спільний тип даних,
обраний з наступного переліку:
- ціле число;
- число з плаваючою комою;
- символ;
- текст;
- інтервал символів;
- послідовність інтервалів символів;
Комірки не можуть мати порожнє значення (`null`).
При створені комірки її значення визначається значенням за замовчуванням
відповідного стовпчика,
що може бути відповідно:
- нуль;
- символ _A_;
- порожній рядок;
- інтервал символів _A–A_;
- порожня послідовність інтервалів символів.
Таблиці та стовпчики мають імена,
що можуть бути змінені користувачем,
проте унікальність імен не вимагається.
Можливості реалізації у загальних рисах продемонстровано у діаграмі прецедентів (@use-case).

Поведінка інтерфейсу системи описана на діаграмі станів (@state).
При завантажені інтерфейсу відображається вікно редагування
таблиці у автоматично створеній базі даних з однією таблицею (@empty).
Приклад вигляду вікна після заповнення таблиці даними та її перейменування
наведено у @table;
Операції, що стосуються бази даних загалом, а не лише поточної таблиці,
винесені у лівостороннє меню (@drawer).
Вибір опції вивантаження чи завантаження бази даних провокує появу
форми ОС вибору місцезнаходження серед файлової системи (@file).

Обчислення різниці поточної таблиці з інакшою реалізовано як
видалення рядків поточної таблиці, що містяться у іншій таблиці.
Інтерфейс вибору іншої таблиці зображено у @popup.
Програмна реалізація цієї операції у пакунку `core` цікава тим,
що вона потребує транспонування таблиць з набору стовпців
однакової довжини до набору рядків однакової довжини.
Звичне представлення таблиці як набору стовпців, а не рядків, зумовлено тим,
що підтримка однакової кількості комірок у всіх стовпцях є програмно легшою
за підтримку однакової кількості _та_ однакових типів комірок у рядках.

У @types наведено приклад таблиці з усіма підтримуваними типами даних.
Відформатований вигляд збереженої на диск у форматі JSON бази даних,
що містить цю та ще одну, порожню таблицю, наступний:

```json
[
  {
    "name": "Table with all types",
    "columns": [
      { "type": "i", "name": "Integer", "cells": [0, 1, -999] },
      { "type": "r", "name": "Real", "cells": [0.0, 2.5, 10000000000.0] },
      { "type": "c", "name": "Character", "cells": [65, 89, 1065] },
      { "type": "s", "name": "String", "cells": ["", "ABC", "¯\\_(ツ)_/¯"] },
      {
        "type": "ci",
        "name": "Character interval",
        "cells": [
          [65, 65],
          [48, 57],
          [40, 41]
        ]
      },
      {
        "type": "cis",
        "name": "Character i-val string",
        "cells": [
          [],
          [[65, 66]],
          [
            [48, 57],
            [88, 89],
            [65, 65]
          ]
        ]
      }
    ]
  },
  { "name": "Empty table", "columns": [] }
]

```


#figure(
  image("class.svg"),
  caption: [
    Діаграма класів пакунку `core`.
  ],
)<class>

#figure(
  image("use-case.svg"),
  caption: [
    Діаграма прецедентів.
  ],
)<use-case>

#figure(
  image("state.svg"),
  caption: [
    Діаграма станів.
  ],
)<state>

#figure(
  image("empty.png"),
  caption: [
    Вигляд інтерфейсу одразу після завантаження.
  ],
)<empty>

#figure(
  image("table.png"),
  caption: [
    Приклад заповненої таблиці.
  ],
)<table>

#figure(
  image("drawer.png"),
  caption: [
    Приклад меню бази даних.
  ],
)<drawer>

#figure(
  image("file.png"),
  caption: [
    Вибір місця збереження бази даних.
  ],
)<file>

#figure(
  image("popup.png"),
  caption: [
    Вибір таблиці для обчислення різниці.
  ],
)<popup>

#figure(
  image("types.png"),
  caption: [
    Таблиця з усіма типами даних.
  ],
)<types>
