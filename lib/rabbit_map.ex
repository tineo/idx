defmodule Dgtidx.RabbitMap do
  @moduledoc """
  This module use :queue and :exchange parameters for RabbitMQ connection.
  """

  @queue  Application.get_env(:dgtidx, :queue)
  @exchange  Application.get_env(:dgtidx, :exchange)
  @doc """
  return a list of channels using one or many connections.
  """
  def get_amqp_channels() do
    queue_name = @queue
    #queue_name2 = "to_process_w2_fn"
    #queue_name3 = "to_process_w2_fn_3"
    #queue_name4 = "to_process_w2_fn_4"
    exchange_name = @exchange

    config  = Application.get_env(:dgtidx, __MODULE__)

    {:ok, connection} = AMQP.Connection.open(config[:url])

    #{:ok, connection2} = AMQP.Connection.open(config[:url])
    #{:ok, connection3} = AMQP.Connection.open(config[:url])

    {:ok, channel} = AMQP.Channel.open(connection)

    #{:ok, channel2} = AMQP.Channel.open(connection2)
    #{:ok, channel3} = AMQP.Channel.open(connection3)

    AMQP.Queue.declare(channel, queue_name, durable: true)
    AMQP.Exchange.direct(channel, exchange_name, durable: true)
    AMQP.Queue.bind(channel, queue_name, exchange_name)
    #AMQP.Basic.qos(channel, prefetch_count: 1000)
    AMQP.Basic.consume(channel, queue_name, nil, no_ack: false)

    #AMQP.Queue.declare(channel, queue_name2, durable: true)
    #AMQP.Queue.bind(channel, queue_name2, exchange_name)
    #AMQP.Basic.consume(channel, queue_name2, nil, no_ack: false)

    #AMQP.Queue.declare(channel, queue_name3, durable: true)
    #AMQP.Queue.bind(channel, queue_name3, exchange_name)
    #AMQP.Basic.consume(channel, queue_name3, nil, no_ack: false)

    #AMQP.Queue.declare(channel, queue_name4, durable: true)
    #AMQP.Queue.bind(channel, queue_name4, exchange_name)
    #AMQP.Basic.consume(channel, queue_name4, nil, no_ack: false)

    [
      channel#,
      #channel2,
      #channel3
    ]

  end

end
