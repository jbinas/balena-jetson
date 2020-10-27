deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_PREPARE  = 'Put the NVidia Jetson Nano Devkit eMMC board in recovery mode'
FLASH_TOOL = 'Unzip BalenaOS image and use the Jetson Flash tool to flash the board. Jetson Flash tool can be found at https://github.com/balena-os/jetson-flash'
DONE_FLASHING  = 'After flashing is completed, please wait until the board is rebooted'

module.exports =
	version: 1
	slug: 'jetson-nano-emmc'
	aliases: [ 'jetson-nano-emmc' ]
	name: 'Nvidia Jetson Nano eMMC'
	arch: 'aarch64'
	state: 'new'

	instructions: [
		BOARD_PREPARE
		FLASH_TOOL
		DONE_FLASHING
	]

	gettingStartedLink:
		windows: 'https://docs.resin.io/jetson-nano-emmc/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/jetson-nano-emmc/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/jetson-nano-emmc/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'jetson-nano-emmc'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-warrior'
		deployArtifact: 'resin-image-jetson-nano-emmc.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition: 12
			path: '/config.json'

	initialization: commonImg.initialization
