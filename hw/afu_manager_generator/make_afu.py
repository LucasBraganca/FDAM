from veriloggen import *

from make_afu_user import make_afu_user


def make_afu(afu_id, input_queue_controller, output_queue_controller, output_queue_controller_dsm, dsm_controller):
    m = Module('afu_%d' % afu_id)
    ADDR_WIDTH = m.Parameter('ADDR_WIDTH', 64)
    QTD_WIDTH = m.Parameter('QTD_WIDTH', 32)
    DATA_WIDTH = m.Parameter('DATA_WIDTH', 512)
    CONF_ID_QUEUE_WIDTH = m.Parameter('CONF_ID_QUEUE_WIDTH', 32)
    INITIAL_INPUT_QUEUE_ID = m.Parameter('INITIAL_INPUT_QUEUE_ID', 0)
    INITIAL_OUTPUT_QUEUE_ID = m.Parameter('INITIAL_OUTPUT_QUEUE_ID', 0)
    NUM_INPUT_QUEUES = m.Parameter('NUM_INPUT_QUEUES', 1)
    NUM_OUTPUT_QUEUES = m.Parameter('NUM_OUTPUT_QUEUES', 1)
    TAG_WIDTH = m.Parameter('TAG_WIDTH', 16)
    FIFO_DEPTH_BITS = m.Parameter('FIFO_DEPTH_BITS', 4)
    FIFO_FULL = m.Parameter('FIFO_FULL', EmbeddedCode('2 ** FIFO_DEPTH_BITS'))
    DSM_DATA_WIDTH = m.Parameter('DSM_DATA_WIDTH', DATA_WIDTH)

    clk = m.Input('clk')
    rst = m.Input('rst')
    start = m.Input('start')
    conf_valid = m.Input('conf_valid', 2)
    conf = m.Input('conf', EmbeddedCode('ADDR_WIDTH + QTD_WIDTH + CONF_ID_QUEUE_WIDTH'))
    available_read = m.Input('available_read', NUM_INPUT_QUEUES)
    request_read = m.Output('request_read', NUM_INPUT_QUEUES)
    request_data = m.Output('request_data', EmbeddedCode('(ADDR_WIDTH+TAG_WIDTH)*NUM_INPUT_QUEUES'))
    read_data_valid = m.Input('read_data_valid')
    read_queue_id = m.Input('read_queue_id', TAG_WIDTH)
    read_data = m.Input('read_data', DATA_WIDTH)
    available_write = m.Input('available_write', NUM_OUTPUT_QUEUES)
    request_write = m.Output('request_write', NUM_OUTPUT_QUEUES)
    write_data = m.Output('write_data', EmbeddedCode('(DATA_WIDTH+ADDR_WIDTH+TAG_WIDTH)*NUM_OUTPUT_QUEUES'))
    write_data_valid = m.Input('write_data_valid')
    write_queue_id = m.Input('write_queue_id', TAG_WIDTH)

    CONF_TYPE_IN_DATA = m.Localparam('CONF_TYPE_IN_DATA', 1)

    rst_reg = m.Reg('rst_reg')
    start_reg = m.Reg('start_reg')
    conf_valid_reg = m.Reg('conf_valid_reg', 2)
    conf_reg = m.Reg('conf_reg', EmbeddedCode('ADDR_WIDTH + QTD_WIDTH + CONF_ID_QUEUE_WIDTH'))
    read_data_valid_reg = m.Reg('read_data_valid_reg')
    read_queue_id_reg = m.Reg('read_queue_id_reg', TAG_WIDTH)
    read_data_reg = m.Reg('read_data_reg', DATA_WIDTH)
    write_data_valid_reg = m.Reg('write_data_valid_reg')
    write_queue_id_reg = m.Reg('write_queue_id_reg', TAG_WIDTH)

    afu_user_available_read = m.Wire('afu_user_available_read', NUM_INPUT_QUEUES)
    afu_user_request_read = m.Wire('afu_user_request_read', NUM_INPUT_QUEUES)
    afu_user_read_data = m.Wire('afu_user_read_data', EmbeddedCode('DATA_WIDTH*NUM_INPUT_QUEUES'))
    afu_user_read_data_valid = m.Wire('afu_user_read_data_valid', NUM_INPUT_QUEUES)

    afu_user_available_write = m.Wire('afu_user_available_write', NUM_OUTPUT_QUEUES)
    afu_user_request_write = m.Wire('afu_user_request_write', NUM_OUTPUT_QUEUES)
    afu_user_write_data = m.Wire('afu_user_write_data', EmbeddedCode('DATA_WIDTH*(NUM_OUTPUT_QUEUES)'))

    afu_user_done = m.Wire('afu_user_done')
    afu_user_done_dsm = m.Wire('afu_user_done_dsm')
    has_peding_rd = m.Wire('has_peding_rd', NUM_INPUT_QUEUES)
    has_peding_wr = m.Wire('has_peding_wr', NUM_OUTPUT_QUEUES)
    has_peding = m.Wire('has_peding')

    input_queue_done = m.Wire('input_queue_done', NUM_INPUT_QUEUES)
    output_queue_done = m.Wire('output_queue_done', NUM_OUTPUT_QUEUES)

    afu_dsm_has_peding_wr = m.Wire('afu_dsm_has_peding_wr')
    afu_dsm_available_write = m.Wire('afu_dsm_available_write')
    afu_dsm_request_write = m.Wire('afu_dsm_request_write')
    afu_dsm_write_data = m.Wire('afu_dsm_write_data', DSM_DATA_WIDTH)

    idx_in_queue = m.Genvar('idx_in_queue')
    idx_out_queue = m.Genvar('idx_out_queue')

    params = [('ID_QUEUE', INITIAL_INPUT_QUEUE_ID + idx_in_queue), ('ADDR_WIDTH', ADDR_WIDTH), ('QTD_WIDTH', QTD_WIDTH),
              ('DATA_WIDTH', DATA_WIDTH), ('CONF_ID_QUEUE_WIDTH', CONF_ID_QUEUE_WIDTH),
              ('CONF_TYPE_IN', CONF_TYPE_IN_DATA),
              ('TAG_WIDTH', TAG_WIDTH), ('FIFO_DEPTH_BITS', FIFO_DEPTH_BITS), ('FIFO_FULL', FIFO_FULL)]
    con = [('clk', clk), ('rst', rst_reg), ('start', start_reg), ('conf_valid', conf_valid_reg), ('conf', conf_reg),
           ('available_read', available_read[idx_in_queue]), ('has_rd_peding', has_peding_rd[idx_in_queue]),
           ('request_read', request_read[idx_in_queue]),
           ('request_data', request_data[
                            idx_in_queue * (ADDR_WIDTH + TAG_WIDTH):idx_in_queue * (ADDR_WIDTH + TAG_WIDTH) + (
                                    ADDR_WIDTH + TAG_WIDTH)]),
           ('read_data_valid', read_data_valid_reg), ('read_queue_id', read_queue_id_reg), ('read_data', read_data_reg),
           ('afu_user_available_read', afu_user_available_read[idx_in_queue]),
           ('afu_user_request_read', afu_user_request_read[idx_in_queue]),
           ('afu_user_read_data', afu_user_read_data[idx_in_queue * DATA_WIDTH:idx_in_queue * DATA_WIDTH + DATA_WIDTH]),
           ('afu_user_read_data_valid', afu_user_read_data_valid[idx_in_queue]),
           ('done', input_queue_done[idx_in_queue])]
    genInputQueue = m.GenerateFor(idx_in_queue(0), idx_in_queue < NUM_INPUT_QUEUES, idx_in_queue.inc(),
                                  'gen_in_queue_controller')
    genInputQueue.Instance(input_queue_controller, 'input_queue_controller', params, con)

    params = [('ID_QUEUE', INITIAL_OUTPUT_QUEUE_ID + idx_out_queue), ('ADDR_WIDTH', ADDR_WIDTH),
              ('QTD_WIDTH', QTD_WIDTH), ('DATA_WIDTH', DATA_WIDTH), ('CONF_ID_QUEUE_WIDTH', CONF_ID_QUEUE_WIDTH),
              ('TAG_WIDTH', TAG_WIDTH), ('FIFO_DEPTH_BITS', FIFO_DEPTH_BITS), ('FIFO_FULL', FIFO_FULL)]
    con = [('clk', clk), ('rst', rst_reg), ('start', start_reg), ('conf_valid', conf_valid_reg), ('conf', conf_reg),
           ('available_write', available_write[idx_out_queue]), ('has_wr_peding', has_peding_wr[idx_out_queue]),
           ('request_write', request_write[idx_out_queue]),
           ('write_data', write_data[idx_out_queue * (DATA_WIDTH + ADDR_WIDTH + TAG_WIDTH):idx_out_queue * (
                   DATA_WIDTH + ADDR_WIDTH + TAG_WIDTH) + (DATA_WIDTH + ADDR_WIDTH + TAG_WIDTH)]),
           ('write_data_valid', write_data_valid_reg), ('write_queue_id', write_queue_id_reg),
           ('afu_user_available_write', afu_user_available_write[idx_out_queue]),
           ('afu_user_request_write', afu_user_request_write[idx_out_queue]),
           ('afu_user_write_data',
            afu_user_write_data[(idx_out_queue) * DATA_WIDTH:(idx_out_queue) * DATA_WIDTH + DATA_WIDTH]),
           ('done', output_queue_done[idx_out_queue])]
    genOutputQueue = m.GenerateFor(idx_out_queue(1), idx_out_queue < NUM_OUTPUT_QUEUES, idx_out_queue.inc(),
                                   'gen_out_queue_controller')
    genOutputQueue.Instance(output_queue_controller, 'output_queue_controller', params, con)

    params = [('AFU_ID', afu_id), ('ID_QUEUE', INITIAL_OUTPUT_QUEUE_ID), ('ADDR_WIDTH', ADDR_WIDTH),
              ('QTD_WIDTH', QTD_WIDTH), ('DATA_WIDTH', DATA_WIDTH), ('CONF_ID_QUEUE_WIDTH', CONF_ID_QUEUE_WIDTH),
              ('TAG_WIDTH', TAG_WIDTH), ('FIFO_DEPTH_BITS', FIFO_DEPTH_BITS), ('FIFO_FULL', FIFO_FULL)]
    con = [('clk', clk), ('rst', rst_reg), ('start', start_reg), ('conf_valid', conf_valid_reg), ('conf', conf_reg),
           ('available_write', available_write[0]), ('has_wr_peding', has_peding_wr[0]),
           ('request_write', request_write[0]),
           ('write_data', write_data[0:(DATA_WIDTH + ADDR_WIDTH + TAG_WIDTH)]),
           ('write_data_valid', write_data_valid), ('write_queue_id', write_queue_id),
           ('afu_user_available_write', afu_user_available_write[0]),
           ('afu_user_request_write', afu_user_request_write[0]),
           ('afu_user_write_data', afu_user_write_data[0:DATA_WIDTH]),
           ('has_wr_peding_dsm', afu_dsm_has_peding_wr),
           ('afu_dsm_available_write', afu_dsm_available_write),
           ('afu_dsm_request_write', afu_dsm_request_write),
           ('afu_dsm_write_data', afu_dsm_write_data),
           ('done', output_queue_done[0])]

    m.Instance(output_queue_controller_dsm, 'output_queue_controller_dsm', params, con)

    params = [('QTD_WIDTH', QTD_WIDTH), ('DSM_DATA_WIDTH', DSM_DATA_WIDTH), ('NUM_INPUT_QUEUES', NUM_INPUT_QUEUES),
              ('NUM_OUTPUT_QUEUES', NUM_OUTPUT_QUEUES)]

    con = [('clk', clk), ('rst', rst_reg), ('start', start_reg), ('done_rd', input_queue_done),
           ('done_wr', output_queue_done),
           ('done_afu', afu_user_done_dsm), ('has_pending_wr', afu_dsm_has_peding_wr),
           ('afu_req_rd_data_en', afu_user_request_read), ('afu_req_wr_data_en', afu_user_request_write),
           ('afu_dsm_available_write', afu_dsm_available_write), ('afu_dsm_request_write', afu_dsm_request_write),
           ('afu_dsm_write_data', afu_dsm_write_data)]

    m.Instance(dsm_controller, 'dsm_controller', params, con)

    afu_user = make_afu_user(afu_id)
    params = [('DATA_WIDTH', DATA_WIDTH), ('NUM_INPUT_QUEUES', NUM_INPUT_QUEUES),
              ('NUM_OUTPUT_QUEUES', NUM_OUTPUT_QUEUES)]
    con = [('clk', clk), ('rst', rst_reg), ('start', start_reg), ('afu_user_done_rd_data', input_queue_done),
           ('afu_user_done_wr_data', output_queue_done), ('afu_user_available_read', afu_user_available_read),
           ('afu_user_request_read', afu_user_request_read), ('afu_user_read_data_valid', afu_user_read_data_valid),
           ('afu_user_read_data', afu_user_read_data), ('afu_user_available_write', afu_user_available_write),
           ('afu_user_request_write', afu_user_request_write), ('afu_user_write_data', afu_user_write_data),
           ('afu_user_done', afu_user_done)]
    m.Instance(afu_user, 'afu_user_%d' % afu_id, params, con)

    has_peding.assign(Uor(Cat(has_peding_rd,has_peding_wr)))
    afu_user_done_dsm.assign(AndList(afu_user_done, ~has_peding))

    m.Always(Posedge(clk))(
        rst_reg(rst),
        start_reg(start),
        conf_valid_reg(conf_valid),
        conf_reg(conf),
        read_data_valid_reg(read_data_valid),
        read_queue_id_reg(read_queue_id),
        read_data_reg(read_data),
        write_data_valid_reg(write_data_valid),
        write_queue_id_reg(write_queue_id)
    )

    return m
