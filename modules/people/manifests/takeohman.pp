class people::takeohman {
	## osx
	# Finder
	include osx::finder::unhide_library
	class osx::finder::show_all_files {
		include osx::finder
		boxen::osx_defaults { 'Show all files':
			user   => $::boxen_user,
			domain => 'com.apple.finder',
			key    => 'AppleShowAllFiles',
			value  => true,
			notify => Exec['killall Finder'];
		}
	}
	include osx::finder::show_all_files

	# Dock
	include osx::dock::autohide

	class osx::dock::kill_dashbord{
		include osx::dock
		boxen::osx_defaults { 'kill dashbord':
			user   => $::boxen_user,
			domain => 'com.apple.dashboard',
			key    => 'mcx-disabled',
			value  => YES,
			notify => Exec['killall Dock'];
		}
	}
	include osx::dock::kill_dashbord

	# Universal Access
	include osx::universal_access::ctrl_mod_zoom
	include osx::universal_access::enable_scrollwheel_zoom

	# Miscellaneous
	include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
	include osx::software_update # download and install software updates

	# include turn-off-dashboard

	# lib
	include autoconf
	include java
#	include php::5_4
	include mysql

	include vagrant
	include virtualbox

	include chrome::chromium
#	include wget
	include textwrangler	
	include mou

	# Network
	include tunnelblick::beta
	include iterm2::stable
	include skype


	include libreoffice

	## or set your own locale
	class { 'libreoffice::languagepack':
	  locale => 'ja'
	}

	package {
	'PhpStorm':
	source=>'http://download-ln.jetbrains.com/webide/PhpStorm-7.1.dmg',
	provider=>'appdmg';

	'FileZilla':
	source=>'http://jaist.dl.sourceforge.net/project/filezilla/FileZilla_Client/3.7.3/FileZilla_3.7.3_i686-apple-darwin9.app.tar.bz2',
	provider=>'compressed_app';

	'GoogleJapaneseInput':
	source=>'https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg',
	provider=>'pkgdmg';

	'SourceTree':
	source=>'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.8.0.3.dmg',
	provider=>'appdmg';

	'SophosAntivirusForMac':
	source => "http://downloads.sophos.com/home-edition/savosx_90_he.zip",
	provider => compressed_app;
	}

	# homebrew
	package {
		[
		'gawk',
		'gnu-sed',
		'gnu-time',
		'tmux',
		'tig',
		'wget',
		'zsh',
		'ghc',		#for haskell
		'haskell-platform', #for haskell
		]:
	}
}

