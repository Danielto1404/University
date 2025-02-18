select GroupName, AvgMark
from Groups
         left join
     (
         select GroupId, avg(cast(Mark as float)) as AvgMark
         from Marks
                  natural join Students
         group by GroupId
     ) GroupMarks using (GroupId)