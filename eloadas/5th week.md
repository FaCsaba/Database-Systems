# Relacios muveletek

relacio algebra
- unaris v binaris
- abstract muveletek where you can use halmazelmelet

join
- theta join
- termeszetes join

these can be switched out for other muveletek
```sql
select * from R, S where <feltetel>
```
Osztas
R / S

```
R:
    z = x U y
    A1  A2  B1  B2
    |   |   |   |
S:
    x
    A1  A2
    |   |

T:
    y
    B1  B2
    |   |
```

Select Vnav, Knev, Lakcim FROM OSZTALZ o, DOLGOZO d, WHERE o.Oszam=d.Osz AD Onev='Kutatas';