extends Node2D

export var portNum:int = 6500
export var maxPlayers:int = 2
export var ip = "127.0.0.1"

func _ready():
	get_tree().connect("network_peer_connected", self , "_player_connected")

func _on_btnHost_button_up():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(portNum, maxPlayers)
	get_tree().set_network_peer(net)


func _on_btnJoin_button_up():
	var net = NetworkedMultiplayerENet.new()
	net.create_client(ip,portNum)
	get_tree().set_network_peer(net)

func _player_connected(id):
	Network.player2id = id
	var game = preload("res://Game.tscn").instance()
	get_tree().get_root().add_child(game)
	self.hide()
