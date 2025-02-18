update Students
set GroupId = (
    select GroupId
    from Groups
    where GroupName = :GroupName
)
where GroupId in
      (
          select GroupId
          from Groups
          where GroupName = :FromGroupName
      )
  and exists
    (
        select 1 from Groups where GroupName = :GroupName
    )