from veriloggen import *


def make_acc_counter():
    m = Module('acc_counter')
    DEPTH_BITS = m.Parameter('DEPTH_BITS', 32)
    clk = m.Input('clk')
    rst = m.Input('rst')
    en = m.Input('en')
    dout = m.OutputReg('dout', DEPTH_BITS)
    m.Always(Posedge(clk))(
        If(rst)(
            dout(0)
        ).Elif(en)(
            dout(dout + 1)
        )
    )
    return m
