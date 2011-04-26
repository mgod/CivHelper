import json
import tech_builder as tech
import trade_builder as trade

def build_json(path):
    open(path, "w").write(json.dumps({
        "techs": tech.data,
        "discounts": tech.discounts,
        "types": tech.types,
        "trade_cards": trade.cards
    }))
