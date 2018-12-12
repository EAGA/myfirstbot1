package = "cqueues"
version = "20171014.53-0"
source = {
	url = "https://github.com/wahern/cqueues/archive/rel-20171014.tar.gz";
	md5 = "d3912ad77724b223e24d1ba55e9a9293";
	dir = "cqueues-rel-20171014";
}
description = {
	summary = "Continuation Queues: Embeddable asynchronous networking, threading, and notification framework for Lua on Unix.";
	homepage = "http://25thandclement.com/~william/projects/cqueues.html";
	license = "MIT/X11";
	maintainer = "Daurnimator <quae@daurnimator.com>";
}
supported_platforms = {
	"linux";
	"bsd";
	"solaris";
}
dependencies = {
	"lua == 5.3";
}
external_dependencies = {
	OPENSSL = {
		header = "openssl/ssl.h";
		library = "ssl";
	};
	CRYPTO = {
		header = "openssl/crypto.h";
		library = "crypto";
	};
}
build = {
	type = "make";
	makefile = "GNUmakefile";

	build_target = "all5.3";
	build_variables = {
		CPPFLAGS= '-I"$(OPENSSL_INCDIR)" -I"$(CRYPTO_INCDIR)"';
		CFLAGS = '$(CFLAGS)';
		LDFLAGS = '$(LIBFLAG) -L"$(OPENSSL_LIBDIR)" -L"$(CRYPTO_LIBDIR)"';
		bindir = "$(LUA_BINDIR)";
		includedir = "$(LUA_INCDIR)";
		libdir = "$(LUA_LIBDIR)";
	};

	install_target = "install5.3";
	install_variables = {
		prefix = "$(PREFIX)";
		lua53cpath = "$(LIBDIR)";
		lua53path = "$(LUADIR)";
		bindir = "$(BINDIR)";
	};
}


package = 'litcord'
version = '1.0.0-1'
source = {
	url = 'git://github.com/satom99/litcord',
	tag = 'master',
}
description = {
	license = 'MIT',
	summary = 'A Lua wrapper for Discord.',
	homepage = 'http://github.com/satom99/litcord',
	maintainer = 'AdamJames <satom99@github>',
}
dependencies = {
	'lua >= 5.1',
	'http',
	'lanes',
	'lunajson',
}
build = {
	type = 'none',
	install = {
		lua = {
			['litcord.init'] = 'litcord/init.lua',
			['litcord.class'] = 'litcord/class.lua',
			--
			['litcord.utils.init'] = 'litcord/utils/init.lua',
			['litcord.utils.date'] = 'litcord/utils/date.lua',
			['litcord.utils.Cache'] = 'litcord/utils/Cache.lua',
			['litcord.utils.Events'] = 'litcord/utils/Events.lua',
			['litcord.utils.Bitwise'] = 'litcord/utils/Bitwise.lua',
			--
			['litcord.structures.init'] = 'litcord/structures/init.lua',
			['litcord.structures.base'] = 'litcord/structures/base.lua',
			['litcord.structures.User'] = 'litcord/structures/User.lua',
			['litcord.structures.Channel'] = 'litcord/structures/Channel.lua',
			['litcord.structures.Message'] = 'litcord/structures/Message.lua',
			['litcord.structures.Emoji'] = 'litcord/structures/Emoji.lua',
			['litcord.structures.Reaction'] = 'litcord/structures/Reaction.lua',
			['litcord.structures.Server'] = 'litcord/structures/Server.lua',
			['litcord.structures.Member'] = 'litcord/structures/Member.lua',
			['litcord.structures.Role'] = 'litcord/structures/Role.lua',
			['litcord.structures.Invite'] = 'litcord/structures/Invite.lua',
			['litcord.structures.Overwrite'] = 'litcord/structures/Overwrite.lua',
			--
			['litcord.client.init'] = 'litcord/client/init.lua',
			['litcord.client.Routiner'] = 'litcord/client/Routiner.lua',
			['litcord.client.Route'] = 'litcord/client/Route.lua',
			['litcord.client.Rest'] = 'litcord/client/Rest.lua',
			['litcord.client.Sock'] = 'litcord/client/Sock.lua',
			['litcord.client.Socket'] = 'litcord/client/Socket.lua',
		},
	},
}