### Глубокое обучение

**Набор данных:**
1) Выберите любой доступный достаточно длинный текст. 
2) Разбейте текст по предложениям на строки. 
3) Максимально сократите число различных символов в тексте: приведите все буквы к нижнему регистру, уберите лишние знаки препинания.
4) Используя **one-hot** кодирование получите векторное представление каждого символа. В том числе и символа конца строки (точки или пробела), после которого генерация строки прекращается.
Хотя её также следует искусственно ограничить максимальной длинной строки.

**Задание:**
Обучите модель трансформер на выбранном тексте предсказывать следующий символ по предыдущим. 
Для обучения можно использовать любую подходящую функцию ошибки (например MSE или CrossEntropy). 
Используйте обученную модель для генерации строки по её началу.

**Модель:**
Под трансформером понимается простая модель, которая использует ***вектор внимания и позиционное кодирование***

