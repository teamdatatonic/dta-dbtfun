with customers as (
    select
      *
    from
      <REF TO STG_CUSTOMERS MODEL>
),

usernames as (
    select
      *
    from
      <REF TO USERNAMES SEED>
),

final as (
    select
      c.*,
      u.username,
      u.date_of_registration as registrationdate
    from customers as c
    left join usernames as u using(customerid)
)

select * from final