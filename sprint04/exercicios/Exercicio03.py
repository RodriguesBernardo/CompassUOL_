from functools import reduce

def calcula_saldo(lancamentos) -> float:
    valores = map(lambda x: x[0] if x[1] == 'C' else -x[0],lancamentos)
    saldo_final = reduce(lambda saldo, valor: saldo + valor, valores)
    return saldo_final