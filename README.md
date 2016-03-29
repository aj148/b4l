#Notes for maintenance: 

##To manually update all Brackets' scores:
- in rails console: "Bracket.all.map {|b| b.update_score!}"
