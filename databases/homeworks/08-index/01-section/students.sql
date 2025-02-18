-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ–7.2.1. Изменение имени студента :StudentId на :StudentName
-- ДЗ–5.1.1. Информация о студентах с заданным идентификатором
-- (:StudentId)
-- Буду использовать hash, так как StudentId у нас primary key.
-- StudentId чаще всего присутствует в natural join, мы знаем,
-- что использование hash будет более эффективным для этих случаев.
-- P.S далее буду приводить ссылки на это объяснение, дабы
-- избежать кучи похожего текста.
create unique index on Students using hash (StudentId);

-- ДЗ–5.2.2. Полная информация о студентах по :StudentName
-- ДЗ–6.1.1. Информацию о студентах по :StudentName
-- ДЗ–5.1.2. Информация о студентах по :StudentName
-- Я буду использовать btree для того чтобы сделать
-- покрывающий индекс, так как в запросах выше, мы всегда
-- хотим по имени студента получить id студента, также иногда
-- нам нужно получать группу студента по его имени (5.2.2).
-- Порядок именно такой, так как мы знаем, что btree хорошо
-- работает с префиксами, по-этому мы можем передать имя студента
-- и GroupId, и при этом эффективно достать StudentId.
-- Также по сравнению со StudentName, GroupId и StudentId
-- довольно небольшие по размеру, что не сильно скажется
-- на хранимых индексов данных.
-- Также есть вариант использовать index вида:
-- create index on Students using hash (StudentName), но покрывающие
-- индексы плохо дружат с hash. Я придерживаюсь логики, что чтение
-- лишней страницы будет работать дольше, по-этому оставлю btree.
create index on Students
    using btree (StudentName, GroupId, StudentId);

-- ДЗ-5.2.1. Полная информация о студентах по :StudentId
-- ДЗ-5.2.2. Полная информация о студентах по :StudentName
-- ДЗ-5.7.2. GroupName и CourseName, такие что все студенты группы
-- сдали предмет
-- Так же использую hash индекс, так как это foreign key для
-- таблицы Groups и по нему в запросах выше происходит natural join
create index on Students using hash (GroupId)