select greatest_number_of_eggs_retrieved,
       lab_location
    from(select lab_ops.cycle_kpis.eggs_retrieved AS greatest_number_of_eggs_retrieved,
            lab_ops.cycle_kpis.lab_location,
       row_number() over (partition by lab_ops.cycle_kpis.lab_location order by lab_ops.cycle_kpis.eggs_retrieved desc) as ranking
from lab_ops.cycle_kpis
where lab_ops.cycle_kpis.eggs_retrieved IS NOT NULL)
AS ranked_list
where ranking = 1
order by greatest_number_of_eggs_retrieved desc