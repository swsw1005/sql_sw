create or replace PROCEDURE sil_juck
(
vsellerno t_order2.sellerno%type)
is
begin

select ( select sum( ord_ea * price_ea ) sil_juck from t_order2
    where sellerno = vsellerno)   from t_order2;

    commit;
end;

/

drop PROCEDURE sil_juck cascade constraints ;
/

exec sil_juck(7839);



select sum( ord_ea * price_ea ) sil_juck from t_order2
    where sellerno = 7788;