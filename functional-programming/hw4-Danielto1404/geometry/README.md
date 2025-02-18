## Геометрия
В данном задании от вас требуется создать дататайп `Point`, который будет представлять точку в двумерном пространстве с целочисленными координатами.

Затем реализуйте функции для работы с точками:
```haskell
plus          :: Point -> Point -> Point
minus         :: Point -> Point -> Point
scalarProduct :: Point -> Point -> Int
crossProduct  :: Point -> Point -> Int
-- Выше имеется в виду псевдоскалярное произведение: (x1, y1) * (x2, y2) = x1 * y2 − x2 * y1
```

Затем реализуйте функции, которые принимают на вход многоугольник без самопересечений, заданный координатами его вершин в порядке против часовой стрелки. Многоугольник может быть как выпуклый, так и не выпуклый.
```haskell
perimeter  :: [Point] -> Double -- Считает периметр
doubleArea :: [Point] -> Int    -- Считает удвоенную площадь
```
Функции должны обрабатывать многоугольники с количеством точек до $10^7$ за 1-2 секунды.

#### Усложненное задание
Необходимо написать несколько тестов измеряющих перфоманс, используя пакет `criterion`.
Напишите для тестов более наивную реализацию и сравните их по времени и памяти.
