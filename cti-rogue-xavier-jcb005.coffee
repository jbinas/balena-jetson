deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BOARD_PREPARE  = 'Put the NVidia Jetson Xavier board in recovery mode'
FLASH_TOOL = 'Unzip BalenaOS image and use <a href=\"https://github.com/balena-os/jetson-flash\">Jetson Flash</a> to provision the device.'
DONE_FLASHING  = 'After flashing is completed, please wait until the board is rebooted'
module.exports =
	version: 1
	slug: 'generic-aarch64'
	aliases: [ 'cti-rogue-xavier-jcb005', 'jetson-xavier', 'generic-aarch64' ]
	name: 'CTI Rogue Xavier AGX + JCB005'
	arch: 'aarch64'
	state: 'released'
	community: true
	private: false

	instructions: [
		BOARD_PREPARE
		FLASH_TOOL
		DONE_FLASHING
	]

	gettingStartedLink:
		windows: 'https://docs.balena.io/jetson-xavier/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.balena.io/jetson-xavier/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.balena.io/jetson-xavier/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: false

	yocto:
		machine: 'cti-rogue-xavier-jcb005'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-honister'
		deployArtifact: 'balena-image-cti-rogue-xavier-jcb005.balenaos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 37
			path: '/config.json'

	initialization: commonImg.initialization
