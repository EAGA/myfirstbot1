
package = "http"
version = "scm-0"

description = {
	summary = "HTTP library for Lua";
	homepage = "https://github.com/daurnimator/lua-http";
	license = "MIT";
}

source = {
	url = "git+https://github.com/daurnimator/lua-http.git";
}

dependencies = {
	"lua >= 5.1";
	"compat53 >= 0.3"; -- Only if lua < 5.3
	"bit32"; -- Only if lua == 5.1
	"cqueues >= 20161214";
	"luaossl >= 20161208";
	"basexx >= 0.2.0";
	"lpeg";
	"lpeg_patterns >= 0.5";
	"binaryheap >= 0.3";
	"fifo";
	-- "psl"; -- Optional
}

build = {
	type = "builtin";
	modules = {
		["http.bit"] = "http/bit.lua";
		["http.client"] = "http/client.lua";
		["http.connection_common"] = "http/connection_common.lua";
		["http.cookie"] = "http/cookie.lua";
		["http.h1_connection"] = "http/h1_connection.lua";
		["http.h1_reason_phrases"] = "http/h1_reason_phrases.lua";
		["http.h1_stream"] = "http/h1_stream.lua";
		["http.h2_connection"] = "http/h2_connection.lua";
		["http.h2_error"] = "http/h2_error.lua";
		["http.h2_stream"] = "http/h2_stream.lua";
		["http.headers"] = "http/headers.lua";
		["http.hpack"] = "http/hpack.lua";
		["http.hsts"] = "http/hsts.lua";
		["http.proxies"] = "http/proxies.lua";
		["http.request"] = "http/request.lua";
		["http.server"] = "http/server.lua";
		["http.socks"] = "http/socks.lua";
		["http.stream_common"] = "http/stream_common.lua";
		["http.tls"] = "http/tls.lua";
		["http.util"] = "http/util.lua";
		["http.version"] = "http/version.lua";
		["http.websocket"] = "http/websocket.lua";
		["http.zlib"] = "http/zlib.lua";
		["http.compat.prosody"] = "http/compat/prosody.lua";
		["http.compat.socket"] = "http/compat/socket.lua";
	};
}

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