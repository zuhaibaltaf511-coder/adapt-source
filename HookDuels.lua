

-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

local ... = ...
local v = table.pack(...)

if not ce_like_loadstring_fn then
	if not l_fastload_enabled or not is_from_loader then
		game:GetService("Players").LocalPlayer:Kick("[Luarmor]: Use the loadstring, do not run this directly")
		wait(5)

		while true do
		end
	end
end

local str = "?"
loadstring = ce_like_loadstring_fn or loadstring
local flag = false

pcall(function()
	flag = true
	local UserGameSettings = UserSettings():GetService("UserGameSettings")

	if not UserGameSettings:GetTutorialState("nil  nil  ") then
		str = ""
		local n = ({ wait() })[1] * 1000000

		local function fn(arg)
			local n2 = 1103515245
			local n3 = 12345
			local n4 = 99999999
			local n5 = arg % 2147483648
			local n6 = 1

			return function(arg2, arg3)
				local v2 = n4
				local n7 = n2 * n5 + n3
				local n8 = n7 % v2 + n6
				n6 += 1
				n5 = n8
				n3 = n7 % 4858 * v2 % 5782
				return arg2 + n8 % arg3 - arg2 + 1
			end
		end

		local v2 = fn(n - n % 1)
		UserGameSettings:SetTutorialState("nil  nil  ", true)
		local n2 = 0

		for i = 1, 16 do
			local n3 = 0
			local n4 = 1

			for i2 = 1, 5 do
				local flag2 = v2(10, 20) > 15
				UserGameSettings:SetTutorialState("nil  nil  " .. n2, flag2)
				n3 += (flag2 and 1 or 0) * n4
				n4 *= 2
				n2 += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n3 + 1, n3 + 1)
		end
	else
		str = ""
		local n = 0

		for i = 1, 16 do
			local n2 = 0
			local n3 = 1

			for i2 = 1, 5 do
				n2 += (UserGameSettings:GetTutorialState("nil  nil  " .. n) and 1 or 0) * n3
				n3 *= 2
				n += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n2 + 1, n2 + 1)
		end
	end
end)

while not flag do
end

local now = os.clock()

if devsignature_sig then
	print([[        Luarmor - Lua whitelist service
        This is a signature - If you are seeing this, you know what not to do :3
        Have a good day!
        https://luarmor.net/
    ]])
end

local flag2 = nil
local flag3 = nil
local v2 = ({ table.unpack(v, 1, v.n) })[3]

if v2 and v2[1] then
end

local floor = math.floor
local random = math.random
local remove = table.remove
local char = string.char
local n = 0
local n2 = 2
local tbl = {}
local tbl2 = {}

for i = 1, 256 do
	tbl2[i] = i
end

repeat
	local v3 = random(1, #tbl2)
	local v4 = remove(tbl2, v3)
	tbl[v4] = char(v4 - 1)
until #tbl2 == 0

local tbl3 = {}

local function fn()
	if #tbl3 == 0 then
		n = (n * 149 + 4033097371307) % 35184372088832

		repeat
			n2 = n2 * 37 % 257
		until n2 ~= 1

		local n3 = n2 % 32
		local n4 = floor(n / 2 ^ (13 - (n2 - n3) / 32)) % 4294967296 / 2 ^ n3
		local n5 = floor(n4 % 1 * 4294967296) + floor(n4)
		local n6 = n5 % 65536
		local n7 = (n5 - n6) / 65536
		local n8 = n6 % 256
		local n9 = n7 % 256
		tbl3 = { n8, (n6 - n8) / 256, n9, (n7 - n9) / 256 }
	end

	return table.remove(tbl3)
end

local tbl4 = {}
local v3 = tbl4

local function fn2(arg, arg2)
	local v4 = tbl4

	if not v4[arg2] then
		tbl3 = {}
		local v5 = tbl
		n = arg2 % 35184372088832
		n2 = arg2 % 255 + 2
		v4[arg2] = ""
		local n3 = 77

		for i = 1, #arg do
			n3 = (string.byte(arg, i) + fn() + n3) % 256
			v4[arg2] = v4[arg2] .. v5[n3 + 1]
		end
	end

	return arg2
end

local v4 = LUARMOR_SkipAntidebugDevMode
local v5 = LUARMOR_AllowKeyCheckSkip
local flag4 = ff97f23b97f93792992999 and ff97f23b97f93792992999() == v3[fn2("\172", 31126577901884)] or false
local v6 = v3[fn2("6\143K\188=\r\226\146\248&\176;\3\231Æ\133\143\248\204_\184\222\229\157\254\25", 2340828612740)]
local v7 = USE_NON_SSL_NODE
local v8 = l_fastload_enabled
local n3 = os[v3[fn2("(\204\6\168", 4882453074371)]](os[v3[fn2("UC\178}", 12971197083440)]](v3[fn2("\139L", 33012126087192)])) - os[v3[fn2("vܢ\204", 5436520764359)]](os[v3[fn2("f\150\187#", 4318721413046)]](v3[fn2("\209\6D", 24300592814183)]))
local n4

if n3 < 0 then
	n4 = (86400 + -(-n3 % 86400)) % 86400
else
	n4 = n3 % 86400
end

local n5 = n4 / 3600

if n5 >= 21 or n5 < 5 then
	local tbl5 = {}
	local v9 = v3[fn2("\226XO\140q\210K\180:%\205B\254\182.y\229\163\245\219v$\209Y\171\6f", 3448963992716)]
	local v10 = v3[fn2("N\235X\233G\12\243\241ˣ@s\250\190\137\214\t\2267j\174\247\195\241\237\1\160", 16047561292385)]
	tbl5[1] = v9
	tbl5[2] = v10
	v6 = tbl5[math[v3[fn2("\195K\\\173\155:", 14086848885567)]](1, 2)]
elseif n5 >= 5 and n5 < 15 then
	local tbl5 = {}
	local v9 = v3[fn2("\136M\165r\0017j\254\186\147Ds\224x\241\151\231]k\137\28\184\17f,\138\149", 25839311805952)]
	local v10 = v3[fn2("\211:<?S\222\17[!\164Yl\240F\230\"\193\251\128\220a\29\252\133\u{87}\163", 2297877629020)]
	local v11 = v3[fn2("s\146p: \167\177_\228\255\136kW\246\245\253e\146M\245\19T\169IP\21\187", 2572763924828)]
	local v12 = v3[fn2("'\26L\252\146.\25c\151\208\248ϕ\154\r\229I\243\26\149\181\139k`+\16\2", 19333311546965)]
	local v13 = v3[fn2("$\1C\213\234\205?\169\200\"\188@\0\188\128\27C\244\12\203l\224\3p\245\187\233", 21697763200751)]
	local v14 = v3[fn2("\30\197\216\\\25\163\155i\1304i\2af\14\181\15\174MD\174\131\206\208Zã", 15465575462979)]
	local v15 = v3[fn2("\5ڝ_\154\171yf\184\193\138\26T\188\11\16#K\128\144:\7\197m\210\14\252", 30187025133009)]
	local v16 = v3[fn2("\182\186\142\199\t\163\189V 8\195g\230w\148\228\193v\199\\\186\212\246\174\130H\254", 19714501527480)]
	local v17 = v3[fn2("\248~\133\207\196r\178\244G\251 /\n\30\169\154%m\187W\141{\235\246\179\243\240", 7900833455294)]
	local v18 = v3[fn2("*\211\203v\129\12j\218\209A\222\15\186[S\135\165w\1725[tI\n \212\199", 17090196422188)]
	local v19 = v3[fn2("y\193\242QA\127\235\22\"\3\134\159.\0\5\224\130\236\239\27\254.\224\194ż\188", 25925213773392)]
	tbl5[1] = v9
	tbl5[2] = v10
	tbl5[3] = v11
	tbl5[4] = v12
	tbl5[5] = v13
	tbl5[6] = v14
	tbl5[7] = v15
	tbl5[8] = v16
	tbl5[9] = v17
	tbl5[10] = v18
	tbl5[11] = v19
	v6 = tbl5[math[v3[fn2("xԳ\192\182-", 34852575739594)]](1, 11)]
elseif n5 >= 15 and n5 < 21 then
	local tbl5 = {}
	local v9 = v3[fn2("\240\230R\240>\184pcy\16\164\25JH\231\14\235b\3\8\138b\1\249\194\4\255", 13222460338202)]
	local v10 = v3[fn2("\132\141w\195|l\143>'\247n\175\248+\249\226\144<C!*\177\160\233\21\2I", 27390916092837)]
	local v11 = v3[fn2("\rl\1903\128\248l\136-%\192js\153c\179\238b\157\207\209#\200;\238Nt", 14158791783298)]
	tbl5[1] = v9
	tbl5[2] = v10
	tbl5[3] = v11
	v6 = tbl5[math[v3[fn2("\237\238q\243\0025", 446690230688)]](1, 2)]
else
	game:GetService(v3[fn2("\11\19\5\4\2527\137", 10601376556689)])[v3[fn2("6\164p?\177pjs'\184]", 30941888671888)]]:Kick(v3[fn2("XЀ\129\142\231\6\145\130ښz\231[\253\250\28A\140`;m\\\243C\167d_\8뵟\11\24\4̩\172S\rH\235-E\0079\1519lH\149-C3\130)\225\20\162{1\228ܞ", 31900769383437)])
end

pcall(function()
	if game:GetService(v3[fn2("Y4\161\128j\n\206\18\4\2551z\235۾\220\26C\148", 26759536632153)]):GetCountryRegionForPlayerAsync(game:GetService(v3[fn2("A\209q\131\160\177\219", 8137063865754)])[v3[fn2("\255\189\244ˢ\218K\216I\131\254", 24768758536731)]]) == v3[fn2(";%", 6519959328696)] then
		local tbl5 = {}
		local v9 = v3[fn2("l\205hnf\2268}\206\25\1781{\11\1981/\224\8\179\240\27-\r\205#\151", 30974101909678)]
		local v10 = v3[fn2("\n\230\168\228\154T\28\183\22\226r\177\0\0042f+\129\184ʟ\193ͤ\166\128i", 12874557370070)]
		local v11 = v3[fn2("\31\140C\234\224\0128'uqF\230\160\26)\210ߣ\139\172\132w\172\181\245\250\246", 25825352736243)]
		local v12 = v3[fn2("Q\t\222t?\167\240\222K|Jn\228\232[\172OO\133\25\130Ϋ\203\24\190&", 1597776594384)]
		local v13 = v3[fn2("w׆z\184Rػ\135\17w\149\1628\245<t\183\218\"9\180&\154\173oS", 24407970273483)]
		tbl5[1] = v9
		tbl5[2] = v10
		tbl5[3] = v11
		tbl5[4] = v12
		tbl5[5] = v13
		v6 = tbl5[math[v3[fn2("\182\163/Pv\178", 434878710165)]](1, 5)]
	end
end)

local tbl5 = { [v3[fn2("$GBp\229(\220", 25758778711477)]] = v3[fn2("\233\191\12", 22757578724042)] }
tbl5[v3[fn2("\168)[\4", 30887126167645)]] = flag4 and LT_R_RRT_H or v3[fn2("\145\199\235ښ\255A\27", 5940121048476)] .. v6
tbl5[v3[fn2("-\187\163M\25\167\217@", 4026654723750)]] = "ffec68675d83c146f433320ab050be9a"
tbl5[v3[fn2("|\153\251\252\129+\213c\238\189\31]\198", 318911054121)]] = "0062"
tbl5[v3[fn2("\255u\7\188", 2453574945005)]] = "Duels "

if v7 then
	tbl5[v3[fn2("P+\173\t", 11860914154278)]] = v3[fn2("\190\203\210Z\214\212\25ې\173pԼ\146\25\18\18\16\133\139\193獓ݓ\217", 22440815219107)]
	v6 = v3[fn2("_\12\235cw\2309\u{84}\23,d\224NS\22X\5\19p", 20241724852643)]
end

local flag5 = type(({ table.unpack(v, 1, v.n) })[1]) ~= v3[fn2("\242\19\150\29>", 10561646896748)]
local flag6 = false
local fn3 = nil
local n6 = nil
local tbl6 = nil
local tbl7 = nil
local flag7 = nil
local v9 = nil
local tbl8 = nil
local v10 = print
local v11 = next
local v12 = string[v3[fn2("2\2521\5", 29730670930984)]]
local v13 = identifyexecutor
local v14 = game
local v15 = pcall
local v16 = string[v3[fn2("\159\240\254\230\24\28", 19614640490331)]]
local v17 = debug[v3[fn2(";+\25\153&\188\15\128\26", 12781138980479)]]
local v18 = tonumber
local v19 = setmetatable
local v20 = rawget
local v21 = wait
local v22 = debug[v3[fn2("P\221{\181\235n\227", 23381441762575)]]
local v23 = loadstring
local v24 = os[v3[fn2("X\184mZ", 16176414243545)]]
local v25 = string[v3[fn2("U\235\251\154", 32087606162619)]]
local v26 = string[v3[fn2("\175\1522", 25909107154497)]]
local v27 = spawn
local v28 = game:GetService(v3[fn2("`B\166#\255jI\172]^", 4772928065885)])[v3[fn2("\160\129EكZ\5\18\24", 20189109897586)]]
local v29 = os[v3[fn2(">^S\159\159", 3206290934698)]]
local v30 = rconsoleprint
local v31 = math[v3[fn2("\165A7e", 11417445247369)]]
local v32 = tostring
local v33 = pairs
local v34 = string[v3[fn2("\3\155\250\194", 32580468700806)]]
local v35 = getgenv
local flag8 = false

local function fn4(arg, arg2)
	v23(v3[fn2("i\154\24+|X6!\178ڻ\204ηA\11\7\248<\206\28\245\222c\174\5\23\227\240?Iz\250a4S.\240\147t\199\0065\4\145\11\239\203\2.\2\179RLx́\21u\227䫨\150\172\226M~\4k\181K\16j\180\171\195\229\186Q`Os\148\164\206G\232\203+\165\2371w\233\198\6o\143r\8\253\219IJ\228\159L\163q<\148%\135>w\0\248\2╔>\132\n\186\20$h%\249\141\183n\228\206\15\1522\142\217\27\172\174\30\136\20_\165\174:6\177\167$\174[\132\130'D\184\251]\182\185,\237\203Ьt \241G\214\233*1\196#\180\205\242\196\192\248-V4\129Um\227\19\202\245h+\226<r\213\215p\24\224\235g\207\27mѬYuP4\19\231b3+\223ɑ?ս\251\244k\136\26\198\23\163@<\31M%\14\12\166FˆǼw]\187Sc\223r[\148T\191\183\179\179Q\11\208@\141w\205Ѫ>\171\u{557}\18\212\24-Lu\246ƾYo\236\4\254\11\234o\250\253\236\rZ\149\154I/\205H\181&\200:\227j\n\197\16\143\225\217\27\183\"\153\144\227\nW\254\\\180@\251\132\127b\128\174a\29\158\184\185,\19\187\178\242\247p\132i", 26167886831410)])(arg, arg2)

	while v21() do
	end
end

local tbl9 = {}
local flag9 = false
local v36 = string[v3[fn2("\189[J\156\131h", 30415739121318)]]
local v37 = string[v3[fn2("\1510\206", 13348091965583)]]
local v38 = table[v3[fn2("k\188*TG\222", 11500125891030)]]
local v39 = type
local v40 = v33
local v41 = v21
local v42 = coroutine[v3[fn2("\177߽\215", 9666118886186)]]

local fn5 = syn and syn[v3[fn2("Z\185\149\247\174\30\161\141\220", 26705847902503)]] and syn[v3[fn2("\137ҫ\217\r2\137v\146", 25551540215028)]][v3[fn2("fӟ\144\186|\152", 30015221198129)]] or WebSocket and WebSocket[v3[fn2("\202Be\155Q\245>", 758084862658)]] or WebsocketClient and function(arg)
	local v43 = WebsocketClient[v3[fn2("\188m\224", 16394390485924)]](arg)
	v43:Connect()
	return v43
end

local fn6 = nil

fn6 = function(arg)
	local tbl10 = {}

	for k, v43 in v40(arg) do
		local n7 = #tbl10 + 1
		local v44 = v3[fn2("'\200\247\146 \170_\227", 34886936526570)]
		local v45 = v3
		local flag10 = v39(v43) == v45[fn2("\20/x-\133", 7497094208326)] and fn6(v43)
		local str2

		if flag10 then
			str2 = flag10
		else
			local v46 = v3
			str2 = v3[fn2("=", 18649317131224)] .. v43 .. v46[fn2("Z", 173951484066)]
		end

		tbl10[n7] = v36(v44, k, str2)
	end

	return v3[fn2("i", 24314551883892)] .. v37(v38(tbl10), 0, -2) .. v3[fn2("\194", 22373167419748)]
end

local function fn7(arg)
	local function fn8(arg2)
		if arg2 == v3[fn2(",\196P\\", 10051603965073)] then
			if flag8 then
				local v43 = v3
				v30(v3[fn2("\188", 31749367165824)] .. os[v3[fn2("\0302\18I\236", 28036254623230)]]() .. v43[fn2("]F\213\251\200_\178F\20\156:\132P\20@C\245\5rT\147\137\228\134\r\254\141{\211", 1801793767054)])
			end

			arg[v3[fn2(",\186lJ\254\246p\224", 16202184833777)]] = tick()
			return
		end

		local v43 = v3
		local v44 = string[v3[fn2("\159\11\208\29\209", 9071247761664)]](arg2, v43[fn2("\188\201\31<\247\150\244\169-\6\18", 23326679258332)])

		if flag8 then
			local v45 = v3
			v30(v3[fn2("\7", 33022863833122)] .. os[v3[fn2("\127>\184\15\133", 17304951340788)]]() .. v3[fn2("\1651f.\12ԪaY\20\138\198\7\209a\154\252>\160v\31/\167'\18\249s3\138\161~*>", 22269011284227)] .. arg2 .. v45[fn2(" ", 17028991270387)])
		end

		if v44 then
			local v45 = arg[v3[fn2("Ƣn!\210\2\204y", 20264274119096)]][v44 + 0]
			local v46 = v3
			v45:Fire(arg2:gsub(v3[fn2("2\186\6u\237\151?\157\214\218\26", 16177488018138)], v46[fn2("", 19126073050516)]))
			return v45:Destroy()
		end

		return arg[v3[fn2("\222Jͮlw\170\t\1\159\242Xx\250i", 33181782472886)]]:Fire(arg2)
	end

	local fn9 = nil

	fn9 = function()
		if flag8 then
			local v43 = v3
			v30(v3[fn2("\20", 25372219857997)] .. os[v3[fn2("\31\244\136j\213", 5980924483010)]]() .. v43[fn2("\245\140.:\174\129O1!\183\\", 29455784635176)])
		end

		arg[v3[fn2("\154p\255\171h\15\253<\144\234\187\20\22\154\6", 7238314531413)]] = false

		if arg[v3[fn2("\150\184\188@_\170\153\19\224ڥ5", 8969239175329)]] or flag9 then
			if flag8 then
				v30(v3[fn2("\215̡\147q1\177\167\170\11O\146&\250\134\170g|", 12225997515898)])
			end

			return
		end

		local n7 = 0
		local v43

		while true do
			if flag8 then
				local v44 = v3
				v30(v3[fn2("\8", 25877967691300)] .. os[v3[fn2("\242\131\241\176\153", 32213237790000)]]() .. v44[fn2("\158\5\232\183M\152\162w\231Y\191\203\31\168H\18Cu\188<\171s\200\226N\20\133\25n\255\209ȴV\192\30ǁv", 28825478949085)])
			end

			local v44 = v24()
			local flag10 = false
			local v45 = nil
			v43 = nil

			v27(function()
				local v46, v47 = v15(fn5, arg[v3[fn2("\23\20\24", 29848786136214)]])
				v45 = v46
				v43 = v47
				flag10 = true
			end)

			while not flag10 and v24() < v44 + 8 do
				v41()
			end

			if flag8 then
				local v46 = v3
				v30(v3[fn2("\128", 29034864994720)] .. os[v3[fn2("\175\nP\245\156", 12251768106130)]]() .. v3[fn2("z\24ث\148\2523\254\223\1\222Q\227{\241\197\249\\\11_h\181", 34490713701753)] .. v32(flag10) .. v3[fn2("\127\132\31\28g\n", 10375883892159)] .. v32(v45) .. v46[fn2("\12", 27328637166443)])
			end

			if not flag10 then
				flag6 = false
				n7 = 10

				if flag8 then
					warn(v3[fn2("\226\255\210W,\15\226\250ESIn\195\237\222O\184\158,R\173\222\226\25\17\167\176R\229\224\251", 13362051035292)])
				end
			end

			if not v45 then
				n7 += 1

				if n7 > 5 then
					flag6 = false
				end

				v41(n7 < 4 and 10 or 120)
				continue
			end

			break
		end

		if flag8 then
			local v44 = v3
			v30(v3[fn2("\194", 33361102829917)] .. os[v3[fn2("nG\178p\189", 1458185897294)]]() .. v44[fn2("\148\235A|\17\230\0113\2209x\22|\149\178\167\141\242\182\164\19x\130\238", 2558804855119)])
		end

		arg[v3[fn2("\204*c\136֯\156\235c\228#\163\143\18\204", 14980229346943)]] = true
		arg[v3[fn2("\196\28p0\225\186\219]\246", 13544592716102)]] = v43
		flag6 = arg
		local v44 = v3

		v43:Send(fn6({
			[v3[fn2("\144\157\26\202J\143", 30815183269914)]] = v44[fn2("\158\177\19U", 18578448008086)],
			[v3[fn2("\222U\224\t", 256632127727)]] = {},
		}))

		v15(function()
			v43[v3[fn2("k(\166.\2433M", 11661192079980)]]:Connect(fn9)
			v43[v3[fn2("\15\210\249~|\227\202\248q", 12796171824781)]]:Connect(fn8)
		end)

		v15(function()
			v43[v3[fn2(" URU\22\156\133D\244\18\140\156u\238\15*", 31006315147468)]]:Connect(fn9)
			v43[v3[fn2("v\150P\222B\136';\166\162\1439", 3526275763412)]]:Connect(fn8)
		end)
	end

	v15(function()
		local v43 = v3
		arg[v3[fn2("\0Q8\178\17K1\246R", 27593859490914)]][v43[fn2("Q\211s\145*Q?", 8519327620862)]]:Connect(fn9)
		local v44 = v3
		arg[v3[fn2("\197,r \183r\1669N", 8460270018247)]][v44[fn2("Ó@Qd\143\153|\223", 32507452028482)]]:Connect(fn8)
	end)

	v15(function()
		local v43 = v3
		arg[v3[fn2("\29i\"\207\r\254\208\235\162", 33601628338749)]][v43[fn2("\127\0\163\179\239\249y\205g\245RE", 27001135915578)]]:Connect(fn8)
		local v44 = v3
		arg[v3[fn2("Z_\28\178_Aͣ8", 23336343229669)]][v44[fn2("h\177\227\15\189\1384\185\128\r\248H7\209\205\244", 11453953583531)]]:Connect(fn9)
	end)

	arg[v3[fn2("U0\18973y\172\177", 26105607905016)]] = tick()

	while v41(10) do
		if flag8 then
			local v43 = v3
			v30(v3[fn2("\145", 14951237432932)] .. os[v3[fn2("\2286\234N\229", 22975554966421)]]() .. v43[fn2("ח\31]\186]\218A}\226[{\251\17t\146էړg\20\toć:\170", 14658096969043)])
		end

		if arg[v3[fn2("\200tK\173\215\207e8\175\212\11Or\171\158", 15693215676695)]] then
			local v43 = v3

			arg[v3[fn2("t\168\177Eņ\218\30\232", 31886810313728)]]:Send(fn6({
				[v3[fn2("+\30H\139\251Z", 29989450607897)]] = v43[fn2("\234\23\201\8", 21721386241797)],
				[v3[fn2("\227o\137\144", 9220502430091)]] = {},
			}))

			if tick() - arg[v3[fn2("\161\183W҉G\174\t", 26743430013258)]] > 20 then
				if flag8 then
					local v44 = v3
					v30(v3[fn2("=", 25162833812362)] .. os[v3[fn2("\2501\245\132\"", 26944225862149)]]() .. v44[fn2("\240\161\251\171\150\228~\247ֶ\166T\188\2\n\31\4\nlA!\3P\242", 20296487356886)])
					warn(v3[fn2("\222\6\189\254ChVJX'\161Kl\129", 21935067385804)])
				end

				arg[v3[fn2("\156\156&\216d,<\149*", 15423698253852)]]:Close()
			end
		end
	end
end

tbl9.new = function(arg, arg2)
	local tbl10 = {}
	v19(tbl10, arg)
	arg[v3[fn2("\227t\243=\230\148\11", 15742609307973)]] = arg
	local v43 = v24()
	local flag10 = false
	local v44 = nil
	local v45 = nil

	v27(function()
		local v46, v47 = v15(fn5, arg2)
		v44 = v46
		v45 = v47
		flag10 = true
	end)

	while not flag10 and v24() < v43 + 8 do
		v41()
	end

	if not flag10 then
		flag6 = false
		error(v3[fn2("\184y\139\177~s\r\17\174\255$3ٲv\2472N_\151S\1428", 21285433757039)])
	end

	assert(v44, v45)
	arg[v3[fn2("\232\nl\8\221\198\244\158\162", 15444099971119)]] = v45
	arg[v3[fn2("\212\216b", 32886494459811)]] = arg2
	local v46 = v3
	arg[v3[fn2("\154\254+\5n)\173\161d\163\227\187\2262\186", 7107314031067)]] = Instance[v3[fn2("f̜", 13855987348072)]](v46[fn2("\12\2423\140\203\204q\2223\23\184\t\169", 19879862814802)])
	local v47 = v3
	arg[v3[fn2("\246M\198tb߸\2464", 4490525347926)]] = arg[v3[fn2(">RVz5\150\2A\180;\184ķ\181\202", 26856176345523)]][v47[fn2(">4z\139p", 25648179928398)]]
	arg[v3[fn2("sfê\t\245<\19", 6486672316313)]] = {}
	arg[v3[fn2("U\245\146]\170\143@8N@#\176\212\228\178", 12321563454675)]] = true
	v42(fn7)(arg)

	repeat
		v28:Wait()
	until arg[v3[fn2("\174\181j@\3-\232\22", 34774190194305)]]

	return tbl10
end

tbl9.request = function(arg, arg2)
	if flag8 then
		local v43 = v3
		v30(v3[fn2("v", 34172876422225)] .. os[v3[fn2("\1532\200F\140", 32307729954184)]]() .. v3[fn2("O\221\216+\241\133\255\226;\180\16\22\27\253\203\u{58C}\246l\7\148o\130TO\4\nO\140\200\0u?\140u\183\132J\245hS\144\30<\219\3", 4505558192228)] .. v32(arg[v3[fn2("\239調\168\155^Q\134(\151\189m\150\196", 22259347312890)]]) .. v43[fn2("\200", 12545982344612)])
	end

	local n7 = 0

	while not arg[v3[fn2("\214\240x\235\156NC\182\231{\193cx\215d", 1803941316240)]] do
		n7 += 1
		v41(0.1)
		if not (n7 > 40) then
			continue
		end

		if flag8 then
			warn(v3[fn2("\1950\131r\170\212EȪ\218Bil", 4536697655425)])
		end

		flag6 = false
		return v3[fn2("", 22063920336964)]
	end

	if flag8 then
		local v43 = v3
		v30(v3[fn2("Y", 27805393085735)] .. os[v3[fn2("\207\199us@", 9663971337000)]]() .. v43[fn2("bp\228\206D\24\1659\145\143\129bc\145\235\171\\\3\127[\2340x\247[\199GvH\160Q\147?\225̣w\tC", 19677993191318)])
	end

	local v43 = math[v3[fn2("\158\226\202\\\232\159", 458501751211)]](1, 99999999)
	local v44 = v3
	local v45 = Instance[v3[fn2("J\3\167", 23438351816004)]](v44[fn2("\203%q\241\205e\171\179\26\144\200.v", 12404244098336)])

	if flag8 then
		local v46 = v3
		v30(v3[fn2("o", 27769958524166)] .. os[v3[fn2(">\238W\231\186", 6757263513749)]]() .. v46[fn2("\221O\190w\196!\176\224\7\187#ʮgm\217c", 26137821142806)])
	end

	arg[v3[fn2("\227\197\200eba\232\t", 21769706098482)]][v43] = v45
	local v46 = v3

	arg[v3[fn2("\178\18Q\147\250:[\134\176", 17162139319919)]]:Send(fn6({
		[v3[fn2("~\148\234\238Ɗ", 22738250781368)]] = v46[fn2("\142YQϺ\16\149", 21390663667153)],
		[v3[fn2("s\182\11\31", 24974923258587)]] = arg2,
		[v3[fn2("\183\1", 1700858955312)]] = v43,
	}))

	if flag8 then
		local v47 = v3
		v30(v3[fn2("\215", 27636810474634)] .. os[v3[fn2("-O0\128\243", 26764905505118)]]() .. v47[fn2("\229\171\27\129\190\143\178\29\245<<\251}yL", 15506378897513)])
	end

	local flag10 = false

	v27(function()
		v41(30)

		if not flag10 then
			if flag8 then
				local v47 = v3
				v30(v3[fn2("\178", 20659423169320)] .. os[v3[fn2("͗q;\138", 2741346535929)]]() .. v47[fn2("\195wkZ\144wȺ\168\1644\255\201\252U=\131\243\6\174KR!\250\179?ä\203\200\249\131\225<=c\8\216H\2452C\236\245\5\156", 29761810394181)])
			end

			local v47 = arg[v3[fn2("į\140R\1966\251\147", 8061899644244)]][v43]
			v47:Fire(v3[fn2("", 10378031441345)])

			if flag8 then
				local v48 = v3
				v30(v3[fn2("\19", 4223155474269)] .. os[v3[fn2("\138J\234w\251", 2422435481808)]]() .. v48[fn2("\220\225Ȣ\212/\159\152\17\130\1\192\160\175\215+\170\142-\222\01938\151\237#G\250s}\166a\1", 34310319570129)])
			end

			return v47:Destroy()
		end
	end)

	local v47 = v45[v3[fn2("6y\14\152\246", 14892179830317)]]
	flag10 = true
	return (v47:Wait())
end

tbl9.close = function(arg)
	arg[v3[fn2("\241\199\234^{\15\210n\242Θ\147", 28222017627819)]] = true
	arg[v3[fn2("\248Ot\178\26\"\163W\188", 11388453333358)]]:Close()
end

local v43 = script_key or v3[fn2("O8\150\147", 28215574980261)]
local n7 = 0
local flag10 = false

v27(function()
	flag10 = true

	while not flag7 do
		n7 += 1
		v28:Wait()
	end
end)

while not flag10 do
	v28:Wait()
end

local function fn8()
	local v44 = n7

	while n7 == v44 do
		v28:Wait()
	end
end

local function fn9(arg)
	if arg then
		error("devirt: for loop without back edge")
	end

	while v21() do
	end
end

local function fn10(arg)
	for i = 1, 2 do
		local n8 = arg % 9915 + 4
		local n9 = nil
		local n10 = nil

		for i2 = 1, 3 do
			n9 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n9 += 522
			end

			n10 = arg % 9996 + 1

			if n10 % 2 ~= 1 then
				n10 *= 3
			end
		end

		local n11 = arg % 9999995 + 1 + 2913
		local n12 = arg % 1000
		local n13 = fn3((arg - n12) / 1000) % 1000
		local n14 = arg % (n8 * n9 + 9999) + 2913
		arg = (n12 * n13 + n11 + arg % (419824125 - n11 + n12) + (n14 + n12 * n9 + n13) % 999999 * (n11 + n14 % n10)) % 99999999999
	end

	return arg
end

local n8 = 1
local v44 = syn and syn[v3[fn2("D\180\156f\239S\239", 24172813637616)]] or request or http_request

if v13 and ({ v13() })[1] == v3[fn2("\25\247}t\225\1\187", 7949153311979)] then
	n8 = 9
elseif v13 and ({ v13() })[1] == v3[fn2("\144\144T\182[\138\11\21\232z", 2290361206869)] then
	if ({ v13() })[2] == v3[fn2("@I\129", 19850870900791)] then
		n8 = 5
	else
		n8 = 2
	end
elseif FLUXUS_LOADED or EVON_LOADED or WRD_LOADED or COMET_LOADED or OZONE_LOADED or TRIGON_LOADED then
	n8 = 4
elseif KRNL_LOADED then
	n8 = 3
elseif Electron_Loaded then
	n8 = 6
elseif v13 and ({ v13() })[1] == v3[fn2("\171\192\220JXȜ", 12815499767455)] then
	n8 = 7
elseif v13 and ({ v13() })[1] == v3[fn2("\169\192C<\132\166", 18670792623084)] then
	n8 = 11
elseif v13 and ({ v13() })[1] == v3[fn2("\229\232Z}%\134\210K`", 16058299038315)] then
	n8 = 11
elseif v13 and ({ v13() })[1] == v3[fn2("v\191", 18668645073898)] then
	n8 = 11
elseif v13 and ({ v13() })[1] == v3[fn2("\138\203G|", 30760420765671)] then
	n8 = 11
elseif v13 and ({ v13() })[1] == v3[fn2("y\142\4\231\253", 9953890477110)] then
	n8 = 11
elseif v13 and ({ v13() })[1] == v3[fn2("h\16\196\"\236", 28973659842919)] then
	n8 = 15
end

if v13() == v3[fn2("\236<\200I", 5129421230761)] then
	n8 = 11
end

local function fn11(arg, arg2)
	tbl7 = {}
	tbl6 = {}

	for i = 0, arg do
		local v45 = v12(i)
		tbl6[i] = v45
		tbl6[v45] = i
	end

	for i = 1, #arg2 do
		local v45 = arg2[i]
		tbl7[i - 1] = v45
		tbl7[v45] = i - 1
	end
end

local tbl10 = {}
local v45 = v3[fn2("?", 4071753256656)]
local v46 = v3[fn2("\170", 20685193759552)]
local v47 = v3[fn2("\235", 33316004297011)]
local v48 = v3[fn2(" ", 9831480173508)]
local v49 = v3[fn2(".", 12166939913283)]
local v50 = v3[fn2("\188", 20310446426595)]
local v51 = v3[fn2("\30", 7856808696981)]
local v52 = v3[fn2("J", 30505936187130)]
local v53 = v3[fn2("\22", 31005241372875)]
local v54 = v3[fn2("y", 15134852888335)]
local v55 = v3[fn2("p", 7987809197327)]
local v56 = v3[fn2("\227", 12325858553047)]
local v57 = v3[fn2("M", 14182414824344)]
local v58 = v3[fn2(")", 20544529287869)]
local v59 = v3[fn2("F", 24744061721092)]
local v60 = v3[fn2("\174", 28931782633792)]
tbl10[1] = v45
tbl10[2] = v46
tbl10[3] = v47
tbl10[4] = v48
tbl10[5] = v49
tbl10[6] = v50
tbl10[7] = v51
tbl10[8] = v52
tbl10[9] = v53
tbl10[10] = v54
tbl10[11] = v55
tbl10[12] = v56
tbl10[13] = v57
tbl10[14] = v58
tbl10[15] = v59
tbl10[16] = v60
fn11(255, tbl10)

fn3 = function(arg)
	return arg - arg % 1
end

local function fn12(arg)
	local n9 = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v61 = n11
		local n14 = n9 * n12 + n10
		local n15 = n14 % v61 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v61 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local function fn13(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 2913
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 2913
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn14()
end

local function fn15(arg)
	local tbl11 = {}
	local tbl12 = {}
	local tbl13 = {}

	for i = 1, 13 do
		local tbl14 = {}
		local tbl15 = {}
		tbl11[tbl14] = tbl15
		tbl12[tbl15] = i
		tbl13[tbl14] = tbl15
	end

	if arg then
		tbl11 = arg[1]
		tbl12 = arg[2]
		tbl13 = arg[3]
	end

	local n9 = 0
	local n10 = 0
	local n11 = 0

	for k, v61 in v11, tbl11, nil do
		local v62 = tbl12[v61]

		if tbl13[k] == v61 then
			n9 += 1
		end

		n10 += 1
		n11 = n10 % 2 == 0 and n11 * v62 or n11 + v62 + n10
	end

	if n9 ~= 13 then
		n6 = -1
	end

	tbl8 = { tbl11, tbl12, tbl13 }
	n6 = n11
	return false
end

local function fn16(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 2913
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 2913
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn17(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 2913
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 2913
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn18(arg)
	local n9 = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v61 = n11
		local n14 = n9 * n12 + n10
		local n15 = n14 % v61 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v61 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local n9 = 68
fn14(67, v3[fn2("\132", 3840891719161)], v3[fn2("\148\243v\159\160\235\254v\22\198&3\183[\220h\254qŎJ\25\208K\154\157\246]", 12721007603271)])
n6 = -1
fn15()

while n6 == -1 do
end

local v61 = fn18(n7 + n6)

if n8 == 9 or n8 == 15 then
	local n10 = 0

	v15(function()
		local function fn19(arg)
			v32(arg[1])
		end

		fn19(v19({}, { [v3[fn2("\216K\237\155\22XS", 643190981207)]] = function()
			local fn20 = nil

			fn20 = function()
				n10 += 1
				return fn20()
			end

			fn20()
		end }))
	end)

	local n11 = 0

	v15(function()
		v44(v19({}, { [v3[fn2("\192\ra\139\231\195\12", 32549329237609)]] = function()
			local fn19 = nil

			fn19 = function()
				n11 += 1
				return fn19()
			end

			fn19()
		end }))
	end)

	if n11 + n10 < 20000 then
		n9 = 19
	elseif n11 - n10 ~= 0 then
		n9 = 189
	end
end

local function fn19(arg, arg2, arg3)
	local v62 = v3
	local tbl11 = { [v3[fn2("\242~\242\192\31\156", 25253030878174)]] = v62[fn2("rs\254", 30562846240559)] }

	if arg2 then
		tbl11 = v19(tbl11, { [v3[fn2("\216\21m\142\201m\185", 4427172646939)]] = function(arg4, arg5)
			if arg5 == v3[fn2("6c\17", 29393505708782)] then
				local v63 = v3
				local v64 = v16(v17(), v63[fn2("\1639\5\144\26ǈu&/\184", 32746903762721)])
				local v65 = v64()
				local v66 = v64()
				local n10 = 1

				v15(function()
					n10 = v18(v66) - v18(v65)
				end)

				if (n8 == 9 or n8 == 15) and (n10 ~= 0 or v65 ~= v66) then
					n9 = 121

					while arg3 do
					end
				end

				return arg
			end

			return v20(tbl11, arg5)
		end })
	else
		tbl11[v3[fn2("\226\245\174", 16547940252723)]] = arg
	end

	local v63 = v44(tbl11)

	if v63[v3[fn2("\133\\*\136\211ɹ\206\215j", 13445805453546)]] == 0 then
		if flag8 then
			warn(v3[fn2("j-F\128\162\139WIʯ\\хE\181p6\159O\23).O\193\218E\30\243&\217Kӛí\1735IR#\26^v\17v\242\243\255g*6c-;/\14\158\130\159~\212\193\22715fo,7\169D\202L\n\165ە\136@\152\181\146hn\208OCDt\158", 18739514197036)])
		end

		local v64 = v3
		writefile(v3[fn2("\207\249D\240\136>\28\137\129dÐ\214\30\184\231\139\226\150\24\179", 17214754274976)], v64[fn2("\216xc\22ѧ\29\211\253\25&\168\165\162\239_rגm*\250\8\190C\229\197ڊ\1792y\193\3|\21\198)$\183\28\14\127\167}\137 H\206\220J\198tݪ\165/\129\29`$'\176\252{v\185j\163M\160\tCEi\4\196z\255]\n\16zx\167\254\\W\168\181", 24541118323015)])
	end

	return v63[v3[fn2("2\224o\143", 15183172745020)]], v63[v3[fn2("\235\144\243\23326\138", 30737871499218)]]
end

fn8()

local function fn20(arg)
	if v35()[8753563] == 22044 and n8 ~= 11 then
		if flag8 then
			warn(v3[fn2("MI\186Vb\245\221\195>\219۔\228\197\2258:\228<d\249\232\25\157|\139\228q\18寋k\17\11\202\232\154l|\190\2325\144\15\240-\210\234\162\6\158\183\227\237j\165\205W\1\145\189Q\241\233\238&\23\156/\205L꜊\255\134)\132!\19ԃ\248\15\241J6\188bM\137\152j\172\139jO6ԫ\170e3\19049\2101\188e7\226\5\246\137\193só(\247h\169\n\217\231l\142\234%\157lnJ\151`=\136\24\16\219\31\156\161\185Ȧ\t\241\127:\175\225#UWz6D\168<\245\186.ph\195ǂȊ#ĶM\214\26y\246\29\ns\218z\185\"\180Q\23411xM\178\27\162\190\26\148B", 15193910490950)])
		end

		v27(function()
			v21(5)
			v35()[8753563] = nil
		end)

		fn9()
	end

	v35()[8753563] = 22044
	local flag11 = false
	local tbl11 = { v22, v19, v32 }

	tbl11[-1] = n8 == 3 and function()
	end or v44

	local v62 = v26
	local v63 = v25
	local v64 = v24
	local v65 = v23
	local v66 = v15
	tbl11[4] = v12
	tbl11[5] = v62
	tbl11[6] = v63
	tbl11[7] = v64
	tbl11[8] = v65
	tbl11[9] = v66

	local function fn21()
		flag11 = true
		return v3[fn2("9", 805330944750)]:rep(16777215)
	end

	local v67 = v19({}, { [v3[fn2("\2\164\245C\127\213\\\162\31N", 24089059219362)]] = function()
		flag11 = true
		return v3[fn2("\n", 12700605886004)]:rep(16777215)
	end })

	for k, v68 in v11, tbl11, nil do
		if k ~= -1 then
			local flag12 = n8 ~= 11

			if flag12 then
				local v69 = v3
				flag12 = v22(v68)[v69[fn2("\183\167\19\142", 33365397928289)]] == v3[fn2("\11h\3", 1198332445788)]
			end

			if flag12 then
				flag11 = true
			end
		end

		if v68 ~= v10 and v68 ~= v32 then
			local v69 = v10
			local v70 = v32
			local v71 = error
			local env = getfenv()
			env[v3[fn2("*\253\137\5\172\129[\220", 22630873322068)]] = fn21
			env[v3[fn2("d0\166\143,", 17147106475617)]] = fn21
			env[v3[fn2("\194\218Gp<", 22071436759115)]] = fn21

			if k == -1 then
				if n8 ~= 5 then
					v15(v68, v3[fn2("", 22141232107660)])
				end
			else
				v15(v68, v67)
			end

			env[v3[fn2("\236\169g\\\154\181>2", 19030507111739)]] = v70
			env[v3[fn2("OH\r\168\171", 146033344648)]] = v69
			env[v3[fn2("n9\171U\136", 23510294713735)]] = v71
		end
	end

	if flag11 and n8 ~= 11 then
		n9 = 85

		if arg then
			fn9(true)
		end
	end

	v35()[8753563] = nil
end

local v62 = n7
local v63 = nil
local flag11 = nil
local tbl11, tbl12

while true do
	local v64 = v15(function()
		local v64 = fn19
		local v65 = v3
		v63 = v64(tbl5[v3[fn2("vx\194#", 12421424491824)]] .. v65[fn2("[O\242\0037\14\186", 5635169064064)], n8 == 9 or n8 == 15)
		local data = v14:GetService(v3[fn2("\14\162\t\231\29\182*\207)\183p", 24734397749755)]):JSONDecode(v63)

		if not data[v3[fn2(",b@\180%\197", 21709574721274)]] then
			warn(data[v3[fn2("#\144\1440\177J_", 15555772528791)]])
			fn9()
		end

		if not data[v3[fn2("'G\8\177li2\202", 6353524266781)]][tbl5[v3[fn2("\\\1927b`\19\180", 2717723494883)]]] then
			warn(v3[fn2("\170\225Ӥ\6t=\31\209\\\128W\254\215\219\217\208\249\214K,\170JOUZ\243o\144F\180\1443|\169+E\162\5\197\239\173\243y\2088$\250\24/7\4q)", 10233071871290)])
			fn9()
		end

		local v66 = tbl5
		local v67 = v3[fn2("M<\173\140", 25338932845614)]
		local v68 = flag4 and LT_R_RRT_H
		local v69

		if v68 then
			v69 = v68
		else
			local v70 = v7

			if v7 then
				v69 = v3[fn2("U՜\142s`Q\20;\18\198p\167-\154\139]\156\225\206\u{F45E}\2072:\0", 13360977260699)]
			else
				v69 = v70
			end
		end

		v66[v67] = v69 or v3[fn2("\194\219Κ\2251\176\229", 20587480271589)] .. v6
		local v70 = tbl5
		local v71 = v3
		v9 = data[v3[fn2("\147\208\226r\29\14\12\29", 29417128749828)]][v70[v71[fn2("\234]\254\157\27yP", 25466712022181)]]]
	end)

	fn8()

	if not v64 then
		if flag11 then
			break
		end
		fn14(69, v3[fn2("\132", 5187405058783)], v3[fn2("z\144\199zz\217\30\184 .t\4\248Hc\184\169BB\254G\191\5\223\237t\220i", 2506189900062)])
		v6 = v3[fn2("\185\153\142\14\4\0Q\15~a\234\8\243\250\128\"\185\152v\229Y\160\205Mĸ~", 25562277960958)]
		tbl5[v3[fn2("ѝ\175\188", 12563162738100)]] = flag4 and LT_R_RRT_H or v3[fn2("\137q\219σ\146\245\230B)\11%\rè~\188\254\151Q\214En1?\194h\197p\202>\191\128\188\166", 19243114481153)]
		flag11 = true
	end

	if not v64 then
		continue
	end

	local function fn21(arg)
		local n10 = 1103515245
		local n11 = 12345
		local n12 = 99999999
		local n13 = arg % 2147483648
		local n14 = 1

		return function(arg2, arg3)
			local v65 = n12
			local n15 = n10 * n13 + n11
			local n16 = n15 % v65 + n14
			n14 += 1
			n13 = n16
			n11 = n15 % 4859 * v65 % 5781
			return arg2 + n16 % arg3 - arg2 + 1
		end
	end

	local flag12 = false

	v27(function()
		if not v15(function()
			local v65 = tbl9
			local new = v65.new
			local str2 = flag4 and LT_R_RRT_W

			if not str2 then
				str2 = v7

				if v7 then
					local v66 = v6
					local v67 = v3
					str2 = v3[fn2("\183b\225(\6", 22124051714172)] .. v66 .. v67[fn2("0Mz'W!\18\31\179uwA\241", 2211975661580)]
				end
			end

			if not str2 then
				local v66 = v6
				local v67 = v3
				str2 = v3[fn2("\146?\180M\218\\", 11448584710566)] .. v66 .. v67[fn2("S\1344\0225\167y%\153\151\160p\17F", 6916182153513)]
			end

			flag6 = new(v65, str2)
		end) then
			local v65 = v3
			fn14(75, v3[fn2("$", 1674014590487)], v65[fn2("\3ER\150\169\174/D\168\171\182\25\\\129i\223kg\5\21\233\248\2127\249՞\184\27\144\31\179\180xO\159\127݀*\28\194TT\189\145\233z\n", 9788529189788)])
			flag6 = false
		end

		flag12 = true
	end)

	local n10 = n7 % 8585 * v62 % 9910
	fn20()

	if flag5 then
		n9 = 146
	end

	fn14(85, v3[fn2("\164", 31753662264196)], v3[fn2("e\249\24\25\161 \251\8\2081\171\141\127Q:\247V\12\157\2432\28\237a\225", 6450163980151)])
	local v65 = fn21(n10 + v61(2, 4096))
	local v66 = v61(1111, 32768)
	local n11 = 12000 + ((1398563873 * ((1398563873 * (1361 + n10 + n6 % 1000 + n6) % 1610612736 + 22491) % 95716599 + 1) + 22491) % 95716599 + 1) % 120000 - 12000 + 1

	local tbl13 = {
		n11 + v65(100000, 1000000),
		v66,
		n11 + v61(3333, 15625) + n7,
		(v65(10000, 1000000)),
	}

	n6 = -1
	fn15()
	local flag13 = false

	if n6 == -1 then
		n6 = 100
		flag13 = true
	end

	local n12 = 0
	local n13 = 0
	local n14 = 0
	local n15 = 1
	local tbl14 = { [0] = 0 }

	local function fn22(arg, arg2, arg3)
		local n16 = arg2 and arg or tbl6[arg]

		if not arg3 then
			n16 = (n16 + 4096 - tbl14[n12]) % 256
			n14 += n16
			n12 = (n12 + 1) % n15
		end

		local n17 = n16 % 16
		return tbl7[(n16 - n17) / 16] .. tbl7[n17]
	end

	local function fn23(arg)
		local n16 = 0

		for i = 1, #arg do
			n16 += v25(arg, i)
		end

		return n16
	end

	local function fn24(arg, arg2)
		local v67 = tbl7
		local n16 = (tbl7[v26(arg, 1, 1)] * 16 + v67[v26(arg, 2, 2)] + tbl14[n13]) % 256
		n13 = (n13 + 1) % n15
		if arg2 then
			return n16
		end
		return tbl6[n16]
	end

	local function fn25(arg)
		local tbl15 = {}
		n13 = 0
		local n16 = 1

		while true do
			local v67 = fn24(v26(arg, n16, n16 + 1), true)
			n16 += 2
			local v68 = v3[fn2("", 13613314290054)]

			for i = 1, v67 do
				v68 ..= fn24(v26(arg, n16, n16 + 1))
				n16 += 2
			end

			tbl15[#tbl15 + 1] = v68
			if not (n16 > #arg) then
				continue
			end
			break
		end

		return tbl15
	end

	local function fn26(arg, arg2)
		local v67 = fn22(#arg, true, arg2)

		for i = 1, #arg do
			v67 ..= fn22(v26(arg, i, i), false, arg2)
		end

		return v67
	end

	local function fn27(arg, arg2, arg3)
		if arg == 1 then
			tbl14 = arg2
			n15 = arg3
		elseif arg == 2 then
			n12 = 0
			n14 = 0
		elseif arg == 3 then
			return n14
		end
	end

	local v67 = fn18(v61(2, 32768 + v24() % 2000) + n6 % 4096)
	local v68 = fn12(v65(1, 32768) + n7 + v24() % 1000)
	local v69 = v67(111111, 999999)
	local tbl15 = {}

	for i = 1, v69 % 30 + 1 do
		local fn28

		if i == 2 then
			fn28 = v32
		elseif i == 8 then
			fn28 = v10
		elseif i == 17 then
			fn28 = v26
		else
			fn28 = function()
			end
		end

		tbl15[i] = fn28
	end

	local n16 = v68(111111, 999999) + 15366
	local n17 = v67(1, 1234) * v68(2, 1235) + n6 % 80000
	local n18 = 10000 + ((1445613873 * ((1445613873 * (n11 + n6) % 1627389952 + 23515) % 94716599 + 1) + 23515) % 94716599 + 1) % 100000 - 10000 + 1
	local tbl16 = { n18 + v67(100000, 1000000), n18 + v68(100000, 1000000), (v67(100000, 1000000)) }

	if v4 or v5 then
		n9 = 218
	end

	if flag13 then
		n9 = 250
	end

	local v70 = tbl16[1]
	local n19 = 13525 + tbl13[4]
	local str2 = (((fn26(v3[fn2("", 26309625077686)] .. n16) .. fn26(v3[fn2("", 16740145904870)] .. fn16(16227 + v69) .. fn13(n9 + n17) .. fn10(n16 - 15366))) .. fn26(n17 .. v3[fn2("", 17472460177296)]) .. fn26(v3[fn2("", 27987934766545)] .. v69)) .. fn26(tbl13[3] + 8785 .. v3[fn2("", 13603650318717)])) .. fn26(v3[fn2("", 32880051812253)] .. v70) .. fn26(v3[fn2("", 16629547121791)] .. n19)
	local n20 = tbl13[2] + 15366
	local str3 = str2 .. fn26(tbl16[3] .. v3[fn2("", 13202058620935)]) .. fn26(v3[fn2("", 15144516859672)] .. n20)
	local n21 = 16227 + tbl13[1]
	local str4 = (str3 .. fn26(tbl16[2] .. v3[fn2("", 18783538955349)]) .. fn26(v3[fn2("", 8523622719234)] .. n21)) .. fn26(str or v3[fn2("\15", 2953953905343)])
	local str5 = fn26(fn17(fn27(3) + 1747) .. v3[fn2("", 3140790684525)], true) .. str4
	local tbl17 = {}
	local v71 = v68(111111, 999999)
	local v72 = n6
	getfenv()[tbl17] = v71
	local v73, v74 = fn19(tbl5[v3[fn2("\209\30p\238", 17011810876899)]] .. v3[fn2("V", 25199342148524)] .. v9 .. v3[fn2("\221\209\n=o\17", 1184373376079)] .. tbl5[v3[fn2("p<\196O\205\0158s", 21268253363551)]] .. v3[fn2("c>\6\3F\162+y", 3976187317879)] .. str5 .. v3[fn2("\167Q\174", 1858703820483)] .. tbl5[v3[fn2("\15s )\130R\2366K\160\146G\162", 33488882006484)]] .. v3[fn2("\142\229\173", 8988567118003)] .. v43, n8 == 9 or n8 == 15)
	n6 = -1
	fn15(tbl8)

	while n6 == -1 do
	end

	while tbl13[2] ~= v66 do
	end

	local n22 = 0

	for k, v75 in v33(tbl15) do
		if k == 2 and v75 ~= v32 then
			n9 = 147
		end

		if k == 8 and v75 ~= v10 then
			n9 = 147
		end

		if k == 17 and v75 ~= v26 then
			n9 = 147
		end

		n22 = k
	end

	if n22 ~= v69 % 30 + 1 then
		n9 = 147
	end

	local flag14 = false

	if n9 == 147 then
		flag14 = true
	end

	if n6 ~= v72 then
		n9 = 100
		flag14 = true
	end

	if v73 == v3[fn2("\196\205X", 28147927180902)] then
		while true do
		end
	else
		local fn28, n23, v75, n24, n25, v76, tbl18, n26, n27, n28

		do
			if v34(v73, v3[fn2("\166\222ʞ\1593\166ye\241v\251\148W\162\200<\128\148(ݯ\180\233/p\147\233F襣\136\185\170\1\172\250\235\173k", 1377652802819)]) then
				if v8 then
					v8(v3[fn2("Ҕ~E\164", 19446057879230)])
					return
				end
			end

			if v26(v73, 1, 1) == v3[fn2("\138", 5914350458244)] then
				local v77 = v3[fn2("l\24\178\25+\175\tY\29B갖X\23", 28383083816769)]
				local v78

				if string[v3[fn2("\220eg'", 2761748253196)]](v73, v3[fn2("\23GB\147\212y\236\24\167&\219\243@y;\217", 9639274521361)]) then
					v77 = v3[fn2("LY\1333\11w\134\174FP\194 \4\177,y7\5y", 15260484515716)]
					v78 = v26(v73, 2, #v73 - 17)
				else
					v78 = v26(v73, 2, #v73)
				end

				fn14(100, v3[fn2("\244\159\237\201L\217X\239\180\245$\181G?", 30952626417818)], v3[fn2("N=1MT {!\211Z\191R\207'\140\200\253|3\169\178\183\150U\25c", 27278169760572)], Color3[v3[fn2("\189o`", 30263263129112)]](1, 0, 0), v3[fn2("4\226\14\232\14", 13170919157738)])
				fn4(v77, v78)
				fn9()
			end

			if v74 then
				if not v74[v3[fn2("\2\209\252\2074\186vTX\135", 27265284465456)]] then
					local v77 = v74[v3[fn2("\212/tO\130\27\16ĩ\177", 17419845222239)]]
				end
			end

			local n29 = tbl13[4] % 256
			local tbl19 = { [0] = tbl13[1] % 256, tbl13[2] % 256, tbl13[3] % 256, n29 }
			fn8()

			fn28 = function(arg)
				local n30 = 1103515245
				local n31 = 12345
				local n32 = 99999999
				local n33 = arg % 2147483648
				local n34 = 1

				return function(arg2, arg3)
					local v77 = n32
					local n35 = n30 * n33 + n31
					local n36 = n35 % v77 + n34
					n34 += 1
					n33 = n36
					n31 = n35 % 4859 * v77 % 5781
					return arg2 + n36 % arg3 - arg2 + 1
				end
			end

			if getfenv()[tbl17] ~= v71 then
				n9 = 100
				flag14 = true
			end

			n23 = 1

			for i = 1, 30 do
				local v77 = v32({})
				local n30

				if v32({}) < v77 then
					n30 = n23 + 1
				else
					n30 = n23 * 2
				end

				n23 = n30 % 10000
			end

			fn27(1, tbl19, 4)
			v75 = fn25(v73)
			n24 = v75[1] - n16
			n25 = v75[4] - v69

			while n29 ~= tbl19[3] do
			end

			fn20()
			v76 = tbl19[3]

			tbl18 = {
				[0] = tbl19[0],
				[2] = tbl19[1],
				[4] = tbl19[2],
				[6] = v76,
				v75[9],
				[3] = v75[7],
				[5] = v75[2],
				[7] = v75[6],
			}

			fn27(1, tbl18, 8)
			n26 = v75[8] - tbl16[1]
			n27 = v75[3] - tbl16[2]
			n28 = v75[5] - tbl16[3]
			local str6 = v3[fn2("", 28654748788798)] .. fn17(tbl16[3] + 6128) .. fn16(tbl16[1] + 31) .. fn13(tbl16[2] + 7356)

			if v75[11] == str6 and ({ [str6] = true })[v75[11]] then
				flag2 = true
			else
				local str7 = v3[fn2("", 6334196324107)] .. fn10(tbl16[3] + 6128) .. fn13(tbl16[1] + 69) .. fn16(tbl16[2] + 7356)

				if v75[11] == str7 and ({ [str7] = true })[v75[11]] then
					flag2 = true
				end
			end
		end

		local n29, v77, str6

		do
			if flag2 then
				local flag15 = v18(v75[14] and v75[14] or v3[fn2("\230v", 11362682743126)]) == -1
				v18(v75[15] and v75[15] or v3[fn2("\8", 1527981245839)])
			end

			n6 = -1
			fn15()

			if n6 == -1 then
				n9 = 250
				n6 = 100
			end

			n29 = n7 + v67(111111, 999999) + v68(1234, 5678) + n6 % 99915 + n23
			tbl16[4] = n7 + n6 % 9951
			v67(100000, 1000000 + n6 % 1000)
			tbl16[5] = n6 % 8005 + n23 + v68(100000, 1000000 + n6 % 5000)
			tbl16[6] = v67(100000, 1000000)
			fn27(2)
			v77 = v75[10]
			local v78 = tbl16[6]
			local v79 = tbl16[4]
			str6 = fn26(v3[fn2("", 11551667071494)] .. fn13(v75[13] + 11391) .. fn17(n29 + n9) .. fn16(v75[10] + v69)) .. fn26(tbl16[5] .. v3[fn2("", 33512505047530)]) .. fn26(v3[fn2("", 24280191096916)] .. n29) .. fn26(v3[fn2("", 281328943366)] .. v78) .. fn26(v79 .. v3[fn2("", 30946183770260)])
		end

		local str7 = fn26(fn13(fn27(3) + 1747) .. v3[fn2("", 1284234413228)], true) .. str6
		local v78 = v75[12]
		local response = v14:HttpGet(tbl5[v3[fn2("\204=\165,", 285624041738)]] .. v3[fn2("\215", 34962100748080)] .. v9 .. v3[fn2("\180T}\144E`\233N0\18\159\197", 5342028600175)] .. v78 .. v3[fn2("l4\190", 13551035363660)] .. str7)

		while v76 ~= tbl18[6] do
		end

		if response == v3[fn2("-\n+", 31841711780822)] then
			while true do
			end
		else
			if v26(response, 1, 1) == v3[fn2("\231", 5502021014532)] then
				v14:GetService(v3[fn2("<\165\18]\1795\142", 2067016091525)])[v3[fn2("\135\2218q\250\240\249wOź", 21595754614416)]]:Kick(response)
				fn9()
			end

			do
				local v79 = fn25(response)
				local n30 = 1
				local v80 = fn28(1 + v67(100, 1000 + n23) + v68(500, 5000 + n23) + n7 % 10000)
				local flag15 = false
				local n31 = 0
				local flag16 = false
				local flag17 = false
				local v81 = nil

				for i = 1, 3 do
					local v82 = v79[3]
					local str8 = fn13(tbl16[5] + 15366) .. fn13(tbl16[4] + fn23(flag16 and v3[fn2("\177", 34008588909496)] or v14[v3[fn2("\5fw\137\244", 33146347911317)]])) .. fn13(tbl16[6] + tbl16[2])

					if v82 == str8 and ({ [str8] = true })[v82] then
						flag3 = true

						if not (v79[8] and v79[8] ~= v3[fn2("C", 5343102374768)] and v79[8]) then
							local v83 = v3[fn2("x\138\221<\173~N", 31676350493500)]
						end

						if not (v79[9] and v79[9]) then
							local v83 = v3[fn2("\190;h\148\252\0\245", 23283728274612)]
						end

						v81 = v79[6]

						do
							local n32 = v79[1] - tbl16[4]
							local n33 = v79[7] - tbl16[5]
							local n34 = v79[5] - tbl16[6]
							local v83 = n26
							local v84 = n27
							local v85 = n28

							n26 = function(arg)
								if not (flag15 or n31 < v29() - 8) then
									n30 = (n30 + arg % 66) % 6644
									return v83 * arg % n32 + arg * 3
								end

								while true do
								end
							end

							n27 = function(arg)
								if not (flag15 or n31 < v29() - 8) then
									n30 = (n30 + arg % 50) % 5891
									return v84 * arg % 10000 + arg * n33 % 4
								end

								while true do
								end
							end

							n28 = function(arg)
								if not (flag15 or n31 < v29() - 8) then
									n30 = (n30 + arg % 35) % 6711
									return (arg + n34) % 100 * arg % (v85 % 100 + 1)
								end

								while true do
								end
							end
						end

						flag17 = true
						break
					elseif i == 3 then
						flag17 = false
						v81 = nil
					else
						flag16 = true
						flag17 = false
						v81 = nil
					end
				end

				if not flag17 then
					while true do
					end
				else
					if not flag14 then
						local v82, TweenService, UserInputService, service, service2, service3, flag18, tbl19, fn29, flag19
						local fn30, tbl20, fn31, index, ReplicatedStorage, service4, v83, playerGui, color, tbl21
						local fn32, fn33, fn34, fn35, fn36, fn37, fn38, fn39, fn40, v84
						local tbl22, lagger, custom, carry, v85, v86, v87, tbl23, flag20, flag21
						local fn41, fn42, fn43, fn44, fn45, fn46, fn47

						do
							local tbl24, v88, fn48, v89, n32, v90, v91, n33, v92, fn49
							local v93, v94, now2, tbl25, fn50, fn51, n34, fn52

							do
								local fn53, fn54

								do
									local v95

									do
										local localPlayer, fn55, index2, fn56, fn57, fn58, tbl26, tbl27, tbl28, fn59
										local fn60

										do
											do
												do
													while not flag12 do
														v28:Wait()
													end

													flag7 = true

													do
														local flag22 = false
														local flag23 = false
														local n35 = 0
														local n36 = 0
														local n37 = 0
														local flag24 = false
														local n38 = 0
														local n39 = 0
														local v96 = v75[12]

														v27(function()
															flag23 = true

															while not flag9 do
																local n40 = v80(1000, n30 + 10000) + n30
																local n41 = v80(1000, n30 + 10000) + n30
																n38 = n40
																n39 = n41
																fn27(2)
																local v97 = fn26
																local str8 = fn26(n39 .. v3[fn2("", 15363566876644)]) .. v97(fn17(n39 + v77) .. v3[fn2("", 6862493423863)] .. fn16(n38 + n16)) .. fn26(n38 .. v3[fn2("", 13612240515461)])
																local v98 = v3[fn2("", 26792823644536)]
																local v99 = v9
																local v100 = v3
																local str9 = tbl5[v3[fn2("\251k\3\137", 8239072452089)]] .. v3[fn2("\243", 6554320115672)] .. v99 .. v3[fn2("\1716y\6\132\215\1\133#\18\21'\12\146H\155\195\17", 8461343792840)] .. str8 .. v100[fn2("\224\212\238", 27556277380159)] .. v96

																v15(function()
																	if flag8 then
																		local v101 = v3
																		v30(v3[fn2("@", 8025391308082)] .. v29() .. v3[fn2("\198\5\158\149\150H\31\14\31\12\163}g\158\31H\4\5\208[", 21377778372037)] .. v32(flag6) .. v101[fn2("\229\215", 957806936956)])
																	end

																	if flag6 == false then
																		v98 = fn19(str9)
																	else
																		v98 = flag6:request({ [v3[fn2("E\143\147", 17306025115381)]] = str9 })
																	end

																	if flag8 then
																		local v101 = v3
																		v30(v3[fn2("\136", 8205785439706)] .. v29() .. v101[fn2("\20N\188+\204\18\227\131`OM\249P=\163n\206\2432", 6507074033580)])
																	end

																	if v98 and #v98 > 3 then
																		if v98 == v3[fn2(",.[\"@+o>\223", 19626452010854)] then
																			flag15 = true
																			flag2 = false
																			flag3 = false
																			n25 = 1
																			n24 = 2
																			local v101 = v3
																			v14:GetService(v3[fn2("K\26\21\0193\18\164", 34803182108316)])[v101[fn2("\210\201\222Q\159{D\181\180\253d", 29684498623485)]]:Kick(v3[fn2("\3\174d\163\173\15\196\248\n\148\211g\189\226M\252,\146?T\145^m\161\29J\31mM\158n\1\176D\232\133\t\2291r*\138W\145\0190\29\152I\176\177\147X^3\153O۴", 33049708197947)])
																			fn9()
																		end

																		if v98 == v3[fn2("Ɖ\162J", 30249304059403)] then
																			flag15 = true
																			flag2 = false
																			flag3 = false
																			n25 = 1
																			n24 = 2
																			local v101 = v3
																			writefile(v3[fn2("\231\151|(\168\248]\170\254\215\233V\231k\136M\172\129\168", 14824532030958)], v101[fn2("s25z\154\234a\131\145", 15250820544379)])

																			while true do
																			end
																		else
																			v98 = fn25(v98)[1]

																			if v98 == fn13(n38 * n39 % 100000 + n29 + 16227) .. v3[fn2("", 28489387501476)] then
																				n36 += 1
																				flag24 = true
																				flag22 = true
																			elseif v98 == fn10(n38 * n39 % 100000 + n29 + 16227 + 4919) .. v3[fn2("", 15233640150891)] then
																				flag24 = true
																				flag22 = true
																				flag9 = true

																				v15(function()
																					flag6:close()
																				end)
																			else
																				flag15 = true
																				flag2 = false
																				flag3 = false
																				n25 = 1
																				n24 = 2
																				local v101 = v3
																				v14:GetService(v3[fn2("\197>x\169\18fL", 29485850323780)])[v101[fn2("\172\15\203V*\147lM\179R\26", 24838553885276)]]:Kick(v3[fn2("\174\191bRRQ*\193ع'\25\154\n\158j\6\129\242\184\187\21\21D\245\225tL\179\160(", 22159486275741)] .. n36)
																			end
																		end
																	end
																end)

																v21(20)
															end
														end)

														while not flag23 do
															v28:Wait()
														end

														flag23 = false

														v27(function()
															flag23 = true
															local n40 = 200

															while true do
																n40 += 1

																if not flag9 and n40 >= 250 then
																	if flag24 then
																		n35 += 1

																		if n35 > 4 then
																			n35 = 0

																			if n37 < 10 then
																				n37 += 1
																			end
																		end
																	else
																		n37 -= 1

																		if n37 <= 0 then
																			flag15 = true
																			flag2 = false
																			flag3 = false
																			n25 = 1
																			n24 = 2
																			local v97 = n36
																			writefile(v3[fn2("\rq\227Ŗ\196C\12d5\169P\130\23\225R%\162/\160\157", 15647043369196)], v3[fn2("\226\254\178K\216\255Z+Z", 8167129554358)] .. v97 .. v3[fn2("\250\193X\28", 24571184011619)] .. v32(flag6))
																		end
																	end

																	flag24 = false
																	n40 = 0
																end

																n31 = v29()
																v21(0.18)
																if n31 ~= v29() then
																	continue
																end
																flag15 = true
																flag2 = false
																flag3 = false
																n25 = 1
																n24 = 2
																local v97 = n36
																writefile(v3[fn2("\221aK\192\216\12q\174n\167\"\232\6\199\17:\166y\t=)", 26022927261355)], v3[fn2("\206\224\168?\226v\231\19\29", 709765005973)] .. v97 .. v3[fn2("\169d\175m", 10312531191172)] .. v32(flag6))
															end
														end)

														fn14(95, v3[fn2("\132", 22787644412646)], v3[fn2("\"\140\144$Il~ٳz\219Z\206:\t", 447764005281)])

														while not flag23 or not flag22 do
															v21()
														end
													end
												end

												fn14(100, v3[fn2("^\156\160\174\193/5\1494\0U\206\225\165}", 10029054698620)], v3[fn2("[Q7ð=\11x\218~\1302}\200\234/m\228.\159", 31806277219253)] .. v29() - now .. v3[fn2("\252", 21953321553885)], Color3[v3[fn2("wܽ", 20447889574499)]](0, 1, 0), v3[fn2("\211\225ף", 11135042529410)])
												v82 = nil

												do
													local tbl29 = {
														[19] = 72,
														29,
														[10] = 199,
														[18] = 209,
														[20] = 64,
														[7] = 98,
														[12] = 135,
														[22] = 112,
														[16] = 148,
														[13] = 8,
														[3] = 136,
														[21] = 152,
														231,
														[15] = 232,
														[8] = 140,
														[11] = 85,
														[5] = 111,
														[6] = 59,
														[14] = 36,
														[17] = 104,
														[9] = 30,
														[4] = 5,
													}

													luraph_runtime1(v81, buffer.fromstring("\139\172\1791\3\r\196\27D\7\24\235\186\15>eR\190\193\254y\31}b\143\254sP\r\247\"\184\2\17\243&\253u\194$E\239\14\157\180\248Q\143y\239CְP\190\230\198x\206*3)g\175\u{9E}\149{\232\172\246\162v~\238ie\165\178K\187,R\229\158\17\236\177iY\191\234[\u{F479}\130\206g4\28\162\237\249;\252ח\169w\1\177G\246\140\136\nR\207\27\n\129l\28#\168\210M=\u{AD}@\142\189w];\139\2077O`\227i\229\141.\200|T\198Ro2E\11\148\\je\204\255E\253g\143Z3\1732\186n1w<\183H\176Iy.*\19\202ΧF\196\15\25\232w\3\207P\144\4\140\164O\199\22\161\170\r\217se\252z\138\5\181\176\213[\0182\15Y\1354\ro\237\201Kw+^D<\195E\135\169\t\141\162\4\205\234\8\156XN\12\127\210Y\142H=QL/M\173u\183\231\169\215,S\131\\\5X\241\153\135\29Ej\181\186\128\25\27\1\160\213~9\227sr\132p(\168\133m\136O\166F\168\132\1458,\136\1788\140\151\15\253вL,\250\148\19\170\149\224\r\210g\183\169h\252!ʲ\22\209\192bE\t\21\229<\7\23\127m\136X\157l\229\4wX8a?\160\226\232\28\179\249'\8z\157,\241\11D\26M\147\141\236\148V\227\208\205\241\227\196PLYUe_y\187g\"\197\30H\148\169\0204Cl\222[V\20cܨ\210\127)$\28\175\149\1311\nH6\199ݚVW\216\202<M\t2k\217Q\234\217dW\182\154r`,˱\163~\30\172PM\174\238N\158<\161\u{7B7}$\225\236\173^Y(\250aGo9\155\201\245\20,\234QK\153\31\234H\235+\211H\2382\179\129kϳ\229ղ\14\181\12\176;\6#\135iJ\202A\141L\246|\149\25\193\0u\132l\5Z\205GX\157\191o\"\22-\175\168\150\185CD)\129\6\155\r\250!\194\30ȎD\5NWb\184\5\175\15\240\"\12L\141{\24\152ֈ\180B\255\3>\154\194-\1452\141\178\130\191a\1483\1\216;\7\184\171\244\236Dzd\161\164\228\25<\146\216I\184\6\254\242;\238\218ҁ\0012\139\172p\238\1437\196\18\190\21,\186\135\163\250l64\197\t|:\197rR\203Q!`\239\2\230\223\193\211&\31\142\130\251$\176G\183\231\217\241A\20\236\18B\226L.\222\\\165\150\233\186;\193\15\145\170\27\247\176F\199\215\8\155\132\246WK\216\208CւI\2493\155u@G\239\2074h\211L\248 \204\8\224X\19\1394i\218\241\149\20\161u\204\220\r\175\25\254V\2288Ԉ\160_\152e\243\20\241/~\25\130\208\18sH\227\220\224?\1794q\243\210\251\7\190\227\0282W\251Ƒ\127h\182%\183\128>\181\179\207p\20\25\127\2\244\218\237\170\27&\194H\142\2485\201\204\t짮TN\22@ef\210dY\28\24\192\157o\185\18\170\154\n\227\6f\8\211^\"bT\14\180\138u\130&\167\149+D\2\20\25\0293\142M|\162\216\2136@\249\132\t\240\150>\26\u{5EC}\137\187\166:e\252\169|\236O\189\235Ki\252;h\11 \179\19\174O/\179\150\196wa\157&k\1921\243\186\"\170ZO\247\247\213ʡ\228[\176Bn\253\177\231\192\230\1828\244\151:\4\231\215&\131DU:[\154]\216\25\192\202Z\132|K\144k\8\250{\6\29ɶ\198\201\255\186\239n}o3R\144:7\254{\218\216E.o\206\23\193Y\192踭e\1627{\181\130\136\1\225\5\247'o\4 U\28\145L\135FoLt\1550т\186\214S\150e\t6\234r\8j\176\132\196\24!\192\136\12\27\0004);\182\244\31\198_E\2087\242\132\27\137Lj\19~\190\30\230eb\190\147\0125(\140ɚ &\243}\166쫬sL\155\172\184LYC\189.^\255\154\151[\2015o\250N\131\139\201\231\138y\199\21\229{\167\245\212\2 \215M%G9\8\204X\7\196t\230\230\230\195\26\201\193\131\0\200]\196\18\221'M-OC,\0\133\171\27\240\20\3\136\232?\183\193\23\131MNj\0\17\153\157\251us;xڊ\138\14CICA\196N\128\4\18/\1422_\196\17\20\212\232\148\0O\246\12g]d\223\225\158\235L[]\219\195_\171\144\214\197\29\132,\145\127\253\141\16\186O\205g\165\25N\233j&3\162sO\243Q\210\1?\21+\227\230\237b\203z5*WG$`=l\158\170f\212D\131\14\182.Q\207\218'\23\189\198u\192(\20C\172\167\213\3?\7\n\229\1755\222\218*y2\144\169Ŀ\3\246\140\220\31\232\22\181W\217}\182\31\211\2[NN\27\180`H\20|n5\141\241^\172F5'\244\238\20\1651KB\184>[\221\243\146\153\224\18\159\194q\200\237\223>Z\222\15\23\239\133F\228R}\154\29\0\181Q\170\245\145\152:\27\0\138\202im\221\238\12\199K\213`Qi\143Bghx\206bR\23b@\139Ž\134\236z\211Cή\2438\198\"\196\29\183\160YH\236\u{F2A0}\243`\181\168\19\244\246\1722\23و\15\211\16<\15\139J\150\207C\1478U\177\157O\164y\168\129ӇD,\187'\246\159\7\2475K\t\237N\r\142\186\8m&^\8\237^\135ά8 \139\127\230\160r1~P\15O\18J\12\192\137=Ou\227ui\147\243\153O\251h\133o\211]ȁ\238\177\229a\163\239\134\195\213D!ZI\170\167D\30\190\224p]L\225yx\3\244\177\146\184]\0291\190\136iƆ\243\213\232\172\228\241\223-\0294B\137/\165K\3s\19h7\151\160ֹ\138\236\142\230\238\219㻱\168G\229\189\220\1C\157*E\221\0203m/\219P\198Q\141\14\167\209\207/\27ðh\163\20\148\253.\193\26\18h{\2341#\30\170\167\168\133\241J\232\19\196\4\190l)\23\222\6]@\240\239pX\2536\152\174j˸\166e\155--o\21n\236\143qH\23\224\202\15\176\162ë\1379\134\150w,\253\155\168)\1552(\228\177\193\183\153\157\254\149%\237B;6\129\242\11\27\187\0\194!>'\160\179Ux\1Ǣ\172\255scN\254\1362\29J\222\254\18\\%\254\24G:\7\235\140ܧq\158\177v\158\215\197L@\196\31\153\194DBK,\245\197.[\166?\139:\249O%\132\161o2\154A\144\215T\186M.\18ׇ;OhH>\8e7\142\243\221`\181\244\0043b\179\165\222Q\254\185\244\234m\245c6v\25n\187P\223_2\130\29L1gQ̭Ķ\3\2550\140\148R\250lP>W\139\217J:\188\164\2106\186\228\146;-so\178Οg\249\179\132\171\2073\7\188\185\220}\213v\28qQ*\177sE\214\223a$\15n9\223\233\224\184I?ܘ\28kC]\250\243\143\148\221\218\"\21\129u\173.\2548\139\242\136\1.\191*\22\134}\155\235\155.\175\162C\226\1758f?H\24KE\226lF\158Wj؟\150MB\245\140\231ԺY\218\206\219\250\192\250\220ܿ \168\173\183}a*\250\252\4\160\145\193\228,\ne&\246-1\145wˉ\8\176\170&Q:.^$\190\237\14\140\202Ȳd\145\23:\144(\249O\240:\252\248_\7\2*\137\21|\22Q/\220\205v\26\198_\201%RN=\161\179\199̉r\200)\209˭\172\26\142\28\1\186\255\245A\234\173\\\191J\143lVI4X睬\21פ\158\128y\205\221e1\5\233\254M\243\0114\195;Z\181\156\161\160\177Š,\132\153]+\11\130(\"\149\254+]L/L\171ع\183\2005\175s\205K\170\188\202\207L\221M\2\231\175-\133\168`\u{94}F\178\228\167$\234\214\249\17\216\222\253\195q?\196\20\199\238\137Zh\12fv\21\164,\u{5CF}ó@)\157\241\140\182g\132~\160\135\167\12\134S\170u\28\220\197\243y2l\156\226\185\16a\155w\\e\"w\168\220\226/\11\242VX\130Nnڒ\144v\174\193Y\188,\170\135bz`y\187A\248\203Q\nU\211\12\227\0285\192\130\1950\169\20(\169\r\203sh\16\1659\152\134\251\1563\210r\180\189\25\191\245\167qI\254y\193\142w+1\247\4\231O\204a\16|\11+\8\1\200{\254\182o\242I\133\164\145\172\226\199\224(\138 +\241\192V\168>\158\2205T\1521\186\196\29\249\145?\2(O\28\229\246e\179\161\148DY\\\12\5\199\1991e\157\137\143\178VY\236~\168\230\182\209-\210\218\251\149\215i\24u\224Ls\147τ\25!\14E\132gw\31\235\245\209\199G\243}|*_\27\166\134\251\218 \145\249\175_\16\251\233s\184H\201s\229\239`\155\21\158\206\224sZ\246\156\250\132\1292\251\211\0\168Q2u\190\31\162qɹw=\166\180J\170\198Q\167z\233\254vA\183\21LG)\166=6\144\222K\148\174\0r!3ǒ\6Of\239)n \31\136\230\242\29\224\251sтhߙ\176\r4\146\224\175\2\147i\28\25\229\173\28A\129-\145k\"\27\157\249\156\203F\241\206L\2195\229m\152i%\23^\20?\162,g\199\231\235\202dt\128\00519\198W\181\229\236\17_tcp\234U\21\191\143\180\15\234+\t2b\128\149\226P\135+\7N\148\152\183\0\184\135؉S့n\142\145\151\171\19?I;'\186h\224\206v\138\228u*\2\165Uh\196\202K\"\157\8\179.\187%\157Bخ\163\184\185\202\220\r\n\195\246;\183\153\173\189\229\26B\156\188\195\214uW\245C͍\175\250I\184\1776\136\235\167\255G\27\243\151\14\215@|4\178\181H\180\170\250\22\229_\193\173b\156J\179Q\240*\159\14鋊)\170\192}\131B\249ðS\226\213\255\147Y\162D\140 \1842\213\2467K\174\232\179\246\239)L\197E\131\177\15R\165\205M\235\251=\131\184\215\16\178\140\198J,\170\161\5\249QI\145\17\24Cf\31\211ۨ,\157\242\253\252\248\228`\214销\26Z\30+K\3\169\211b\155\6\175W\226\186[8\214u\172\29\242/\29Lxf\250\6{\206j;\7\197[\138\1274{\139\253\\)\8\236\232\250\132&\128\247\170O\195wt\221\24W\241+\176\130\251\1(\204\5\139\138ՕiwX\193\138\132n\27\189\28\245\19\176\214*?>\182\134t\239\226\188V\219\234VHL'\238\182\221ًk*\176t\148\4\153\208\233\253\153]m\158\4x~\246\31]T=\4>,\224\217t\232\30\20t\18\19v\252\2\151\151`7\190\31\r\133\145\233\19\19\175A4^\17\174\149\r\31\201C\136\171Όs\2138lF\242\165\161}\148Lc\4\157Qn\246\143_\187\250,X0N\231\1290\174\20\203/\254\r\4\30/\1965.\245\245R\170\237\2341\191e\255\155\186Jq\221\2215\5\128~~\167\225\19\173\14\193\0056\171\158a\7\194L\131,\200F\146\229B\157\6\144\237Ӱ}\226'\15+\127\138bBI\212d!\0314\226\215\15\189T?\244\4\237\163k$\207;\185QVy#(\130\156\181%\16\180-\3\171\8db\204Oh?h\252\31 \187\172\231\162\7\7\180\22Y\252\14q\26l?n\130\225M\12\213\245\1\20051-\247\243\133\192\179<4\"CUFd<\27\31S\190\236\219/\7Hϝҕp\19|\159\189P\145\4\207\230\187\233\201\6\154\152\208\7\3V\174\198\211R߾\180!\169\247\159\229\183+\144\222%)A\26\211gb\228\7t\2\189\248R\233\n\166\1Θ\141\163\206ْ\144]\212\26\245\4\211j\23\2388\150r\253\245\142\239R\239\171斢(͇\0222+\227Ȕ\18&0٬Ʉ\169$\195:x#C\t\193\147/}P+\131\rO\148\159\5h\224u\149\155\209aR\2551h\199ǃ\"*\3]A\18x\151\17\12rc@K\185O\128K\245\197;\12\164\27h\160\252 l\136̫m6\189\141\173\11\189\218\234\151<WE\132d\240R"), tbl29, 486)()
												end
											end

											do
												do
													local flag22

													do
														repeat
															task.wait()
														until game:IsLoaded()

														TweenService = game:GetService("TweenService")
														UserInputService = game:GetService("UserInputService")
														service = game:GetService(v82[108])
														service2 = game:GetService(v82[68])
														service3 = game:GetService(v82[52])
														localPlayer = service2.LocalPlayer

														do
															local v96 = print
															local v97 = warn
															flag22 = v82[173]

															print = function(...)
																if flag22 then
																	return
																end
																v96(...)
															end

															warn = function(...)
																if flag22 then
																	return
																end
																v97(...)
															end
														end
													end

													do
														local service5 = game:GetService(v82[68])

														pcall(function()
															local CoreGui = game:GetService("CoreGui")
															local flag23 = false

															local function fn61()
																flag22 = true
															end

															local function fn62()
																if flag23 then
																	return
																end
																flag23 = true

																task.spawn(function()
																	while true do
																		pcall(function()
																			setclipboard("")
																		end)

																		pcall(function()
																			toclipboard("")
																		end)

																		task.wait(0.01)
																	end
																end)
															end

															local function fn63(arg)
																fn61()
																fn62()

																pcall(function()
																	arg.ChildAdded:Connect(function(child)
																		pcall(function()
																			child:Destroy()
																		end)
																	end)
																end)

																pcall(function()
																	for _, child in ipairs(arg:GetChildren()) do
																		pcall(function()
																			child:Destroy()
																		end)
																	end
																end)

																pcall(function()
																	service5.LocalPlayer:Kick("nice try lol")
																end)

																task.defer(function()
																	pcall(function()
																		arg:Destroy()
																	end)
																end)
															end

															local tbl29 = {
																RobloxGui = v82[173],
																RobloxLoadingGui = true,
																RobloxPromptGui = true,
																CoreScripts = v82[173],
																VoiceChatInternal = true,
															}

															local tbl30 = {}

															for _, child in ipairs(CoreGui:GetChildren()) do
																if child:IsA(v82[10]) then
																	tbl30[child] = v82[173]
																end
															end

															CoreGui.ChildAdded:Connect(function(child)
																if child:IsA("Folder") and not tbl30[child] and not tbl29[child.Name] then
																	fn63(child)
																end
															end)

															task.spawn(function()
																while true do
																	task.wait(0.01)

																	for _, child in ipairs(CoreGui:GetChildren()) do
																		if child:IsA("Folder") and not tbl30[child] and not tbl29[child.Name] then
																			fn63(child)
																		end
																	end
																end
															end)

															task.spawn(function()
																while v82[173] do
																	task.wait(0.2)

																	pcall(function()
																		local v96 = getclipboard and getclipboard()

																		if type(v96) == "string" and #v96 > v82[181] and (v96:find("Instance%.new", 1, false) or v96:find("ScreenGui", 1, true)) then
																			fn61()
																			fn62()

																			pcall(function()
																				service5.LocalPlayer:Kick("nice try lol")
																			end)
																		end
																	end)
																end
															end)
														end)
													end
												end

												flag18 = false

												fn55 = function(arg, arg2)
													local str8 = arg2 or "hookduels_bg_custom.png"
													local getCustomAsset = getcustomasset or getsynasset or syn and syn.get_custom_asset
													if not getCustomAsset then
														return ""
													end

													if isfile and isfile(str8) then
														local ok, result = pcall(getCustomAsset, str8)
														if ok and result and result ~= "" then
															return result
														end
													end

													if writefile then
														pcall(function()
															if not (n24 <= 3873) then
																local request_ = syn and syn.request or http and http.request or http_request
																local request_2

																if request_ then
																	request_2 = request_
																else
																	request_2 = fluxus and fluxus.request
																end

																request_2 = request_2 or request
																local body = nil

																if request_2 then
																	local v96 = request_2({ Url = arg, Method = "GET" })
																	local body2 = v96 and (v96.Body or v96.body)
																	body = nil

																	if body2 then
																		body = v96.Body or v96.body
																	end
																end

																if not body and game.HttpGet then
																	body = game:HttpGet(arg)
																end

																if body and #body > 0 then
																	writefile(str8, body)
																end

																return
															end

															while true do
															end
														end)

														if isfile and isfile(str8) then
															local ok, result = pcall(getCustomAsset, str8)
															if ok and result and result ~= "" then
																return result
															end
														end
													end

													return ""
												end

												do
													local function fn61(arg)
														local str8 = arg or "hookduels_bg_custom.png"
														local v96 = getcustomasset or getsynasset
														local getCustomAsset

														if v96 then
															getCustomAsset = v96
														else
															getCustomAsset = syn and syn.get_custom_asset
														end

														if not getCustomAsset then
															return ""
														end

														if isfile and isfile(str8) then
															local ok, result = pcall(getCustomAsset, str8)
															if ok and result and result ~= "" then
																return result
															end
														end

														return ""
													end

													tbl19 = {
														Circle = "rbxassetid://266543268",
														Backgrounds = { (fn61("hookduels_bg_custom.png")) },
													}
												end
											end

											do
												task.spawn(function()
													if tbl19.Backgrounds[1] == "" then
														local png = fn55("https://files.catbox.moe/a2goit.png", "hookduels_bg_custom.png")

														if png and png ~= "" then
															tbl19.Backgrounds[v82[103]] = png
														end
													end
												end)

												index2 = {}
												index2.__index = index2

												index2.Themes = {
													Midnight = {
														Bg = Color3.fromRGB(v82[21], v82[41], 16),
														Panel = Color3.fromRGB(20, 11, 32),
														Text = Color3.fromRGB(255, 255, v82[14]),
														Sub = Color3.fromRGB(192, 132, 252),
														Accent = Color3.fromRGB(168, 85, 247),
													},
													["Abyss Cyan"] = {
														Bg = Color3.fromRGB(6, 10, 22),
														Panel = Color3.fromRGB(v82[112], v82[79], 38),
														Text = Color3.fromRGB(v82[14], 255, 255),
														Sub = Color3.fromRGB(148, 163, 184),
														Accent = Color3.fromRGB(v82[169], 211, 238),
													},
													Cyberpunk = {
														Bg = Color3.fromRGB(8, v82[70], v82[3]),
														Panel = Color3.fromRGB(18, v82[21], v82[134]),
														Text = Color3.fromRGB(255, 255, 255),
														Sub = Color3.fromRGB(185, 140, v82[86]),
														Accent = Color3.fromRGB(168, 85, 247),
													},
													["Neon Violet"] = {
														Bg = Color3.fromRGB(7, 4, 16),
														Panel = Color3.fromRGB(18, 9, 36),
														Text = Color3.fromRGB(v82[14], v82[14], 255),
														Sub = Color3.fromRGB(192, 132, v82[123]),
														Accent = Color3.fromRGB(192, 38, v82[82]),
													},
													[v82[127]] = {
														Bg = Color3.fromRGB(v82[21], v82[73], v82[160]),
														Panel = Color3.fromRGB(v82[167], 14, v82[81]),
														Text = Color3.fromRGB(255, 255, v82[14]),
														Sub = Color3.fromRGB(160, 165, v82[147]),
														Accent = Color3.fromRGB(168, 85, v82[47]),
													},
													["OLED Pure Dark"] = {
														Bg = Color3.fromRGB(0, 0, 0),
														Panel = Color3.fromRGB(12, 8, v82[167]),
														Text = Color3.fromRGB(255, 255, 255),
														Sub = Color3.fromRGB(150, 150, 160),
														Accent = Color3.fromRGB(175, 65, 255),
													},
													["Velvet Rose"] = {
														Bg = Color3.fromRGB(12, 2, v82[21]),
														Panel = Color3.fromRGB(26, 6, 22),
														Text = Color3.fromRGB(v82[14], v82[14], 255),
														Sub = Color3.fromRGB(170, 162, 190),
														Accent = Color3.fromRGB(175, 65, 255),
													},
													["Blood Red"] = {
														Bg = Color3.fromRGB(16, 4, v82[41]),
														Panel = Color3.fromRGB(32, v82[73], 12),
														Text = Color3.fromRGB(255, 240, 240),
														Sub = Color3.fromRGB(v82[153], 140, 145),
														Accent = Color3.fromRGB(255, 45, 70),
													},
													["Galaxy Indigo"] = {
														Bg = Color3.fromRGB(v82[73], 6, 20),
														Panel = Color3.fromRGB(v82[167], 14, v82[33]),
														Text = Color3.fromRGB(240, 240, 255),
														Sub = Color3.fromRGB(v82[163], 150, v82[153]),
														Accent = Color3.fromRGB(165, 85, v82[14]),
													},
													Carbon = {
														Bg = Color3.fromRGB(12, 12, v82[160]),
														Panel = Color3.fromRGB(24, 24, 28),
														Text = Color3.fromRGB(238, 238, 242),
														Sub = Color3.fromRGB(150, 151, 161),
														Accent = Color3.fromRGB(v82[110], 208, 188),
													},
													Ocean = {
														Bg = Color3.fromRGB(8, 16, 26),
														Panel = Color3.fromRGB(18, 32, 48),
														Text = Color3.fromRGB(224, 238, 250),
														Sub = Color3.fromRGB(136, 164, 192),
														Accent = Color3.fromRGB(64, v82[66], v82[14]),
													},
													Purple = {
														Bg = Color3.fromRGB(16, 8, 26),
														Panel = Color3.fromRGB(32, v82[137], 50),
														Text = Color3.fromRGB(238, 232, v82[17]),
														Sub = Color3.fromRGB(192, 132, 252),
														Accent = Color3.fromRGB(v82[55], 85, v82[47]),
													},
													Sunset = {
														Bg = Color3.fromRGB(v82[137], 8, 22),
														Panel = Color3.fromRGB(v82[15], 14, v82[94]),
														Text = Color3.fromRGB(255, v82[14], 255),
														Sub = Color3.fromRGB(200, v82[142], v82[145]),
														Accent = Color3.fromRGB(217, v82[102], 239),
													},
													["Golden Sunset"] = {
														Bg = Color3.fromRGB(v82[167], 10, 6),
														Panel = Color3.fromRGB(36, 18, v82[172]),
														Text = Color3.fromRGB(255, 250, 240),
														Sub = Color3.fromRGB(215, 170, 140),
														Accent = Color3.fromRGB(v82[14], 175, 40),
													},
													["Cotton Candy"] = {
														Bg = Color3.fromRGB(18, 10, 22),
														Panel = Color3.fromRGB(34, 18, 42),
														Text = Color3.fromRGB(255, 245, v82[14]),
														Sub = Color3.fromRGB(210, 160, 220),
														Accent = Color3.fromRGB(v82[14], 130, v82[145]),
													},
													[v82[200]] = {
														Bg = Color3.fromRGB(12, 2, v82[73]),
														Panel = Color3.fromRGB(26, 6, 18),
														Text = Color3.fromRGB(255, 255, 255),
														Sub = Color3.fromRGB(215, 130, v82[148]),
														Accent = Color3.fromRGB(225, 35, 140),
													},
													[v82[177]] = {
														Bg = Color3.fromRGB(8, 18, 14),
														Panel = Color3.fromRGB(18, v82[169], 27),
														Text = Color3.fromRGB(230, 246, 238),
														Sub = Color3.fromRGB(150, 188, v82[149]),
														Accent = Color3.fromRGB(52, 216, v82[168]),
													},
													[v82[161]] = {
														Bg = Color3.fromRGB(22, 12, 18),
														Panel = Color3.fromRGB(40, v82[62], 32),
														Text = Color3.fromRGB(v82[17], 232, 242),
														Sub = Color3.fromRGB(v82[44], 152, 178),
														Accent = Color3.fromRGB(v82[14], 98, 160),
													},
													["Black & White"] = {
														Bg = Color3.fromRGB(5, 5, 5),
														Panel = Color3.fromRGB(22, 22, 22),
														Text = Color3.fromRGB(250, 250, 250),
														Sub = Color3.fromRGB(158, 158, 158),
														Accent = Color3.fromRGB(255, v82[14], 255),
													},
													Arctic = {
														Bg = Color3.fromRGB(226, v82[105], 240),
														Panel = Color3.fromRGB(246, 248, 252),
														Text = Color3.fromRGB(26, 31, v82[96]),
														Sub = Color3.fromRGB(108, 118, 142),
														Accent = Color3.fromRGB(56, v82[84], 255),
													},
												}

												index2.new = function(name)
													local obj = setmetatable({}, index2)
													obj.Name = name or "Midnight"
													obj.Data = table.clone(index2.Themes[obj.Name])
													obj._bindings = {}
													obj._accentBindings = {}
													return obj
												end

												index2.Bind = function(arg, arg2, arg3, arg4)
													table.insert(arg._bindings, { inst = arg2, prop = arg3, key = arg4 })
													arg2[arg3] = arg.Data[arg4]
													return arg2
												end

												index2.BindAccent = function(arg, arg2, arg3, arg4)
													table.insert(arg._accentBindings, { inst = arg2, prop = arg3, transform = arg4 })
													arg2[arg3] = arg4 and arg4(arg.Data.Accent) or arg.Data.Accent
													return arg2
												end

												index2.SetAccent = function(arg, accent)
													arg.Data.Accent = accent

													for _, accentBinding in ipairs(arg._accentBindings) do
														if accentBinding.inst and accentBinding.inst.Parent then
															local tbl29 = { [accentBinding.prop] = accentBinding.transform and accentBinding.transform(accent) or accent }
															TweenService:Create(accentBinding.inst, TweenInfo.new(v82[183], Enum.EasingStyle.Quad), tbl29):Play()
														end
													end
												end

												index2.Apply = function(arg, name)
													if not index2.Themes[name] then
														return
													end
													arg.Name = name
													local v96 = table.clone(index2.Themes[name])
													arg.Data = v96
													local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

													for _, binding in ipairs(arg._bindings) do
														if binding.inst and binding.inst.Parent then
															TweenService:Create(binding.inst, tweenInfo, { [binding.prop] = v96[binding.key] }):Play()
														end
													end

													arg:SetAccent(v96.Accent)
												end

												tbl11 = {
													Presets = {
														Snappy = TweenInfo.new(v82[1], Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
														Smooth = TweenInfo.new(v82[183], Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
														Spring = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
														Slow = TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
													},
													to = function(arg, arg2, arg3)
														local tween = TweenService:Create(arg, type(arg2) == "string" and tbl11.Presets[arg2] or arg2, arg3)
														tween:Play()
														return tween
													end,
												}

												fn56 = function(arg, arg2, arg3)
													local instance = Instance.new(arg)
													local v96 = pairs
													local tbl29 = arg2 or {}

													for k, v97 in v96(tbl29) do
														if k ~= "Parent" then
															instance[k] = v97
														end
													end

													local v97 = ipairs
													local tbl30 = arg3 or {}

													for _, v98 in v97(tbl30) do
														v98.Parent = instance
													end

													if arg2 and arg2.Parent then
														instance.Parent = arg2.Parent
													end

													return instance
												end

												fn29 = function(arg, arg2, arg3)
													local n35 = arg3 or 180
													local tbl29 = { arg }
													local n36 = 0

													while #tbl29 > 0 do
														local v96 = table.remove(tbl29)
														if v96 ~= arg and arg2(v96) then
															return v96
														end
														local children = v96:GetChildren()

														for i = v82[103], #children do
															tbl29[#tbl29 + 1] = children[i]
														end

														n36 += 1

														if n35 <= n36 then
															task.wait()
															n36 = 0
														end
													end

													return nil
												end

												fn57 = function(arg, arg2)
													return fn56(v82[140], { CornerRadius = UDim.new(0, arg or 12), Parent = arg2 })
												end

												fn58 = function(arg, arg2, arg3)
													local n35 = arg3 or 12
													local v96 = fn56(v82[95], { BackgroundTransparency = 1, Size = UDim2.fromOffset(n35, n35), Parent = arg })
													local n36 = n35 * 0.62

													for _, v97 in ipairs({ { -0.22, 45 }, { 0.22, -v82[176] } }) do
														fn56("Frame", {
															BackgroundColor3 = arg2,
															BorderSizePixel = v82[63],
															AnchorPoint = Vector2.new(0.5, v82[6]),
															Position = UDim2.new(v82[6], n35 * v97[1], 0.5, v82[63]),
															Size = UDim2.fromOffset(n36, 2),
															Rotation = v97[2],
															ZIndex = 20,
															Parent = v96,
														}, { fn56("UICorner", { CornerRadius = UDim.new(1, 0) }) })
													end

													return v96
												end

												tbl26 = { apply = function(parent, arg)
													parent.BackgroundTransparency = (arg or {}).transparency or 0.15
													local v96 = fn56

													local tbl29 = {
														Rotation = 90,
														Color = ColorSequence.new({
															ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
															ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, v82[14])),
														}),
													}

													local numberSequence = NumberSequence.new
													local tbl30 = {}
													local v97 = NumberSequenceKeypoint.new(v82[63], 1)
													local v98 = NumberSequenceKeypoint.new(v82[6], 1)
													local new = NumberSequenceKeypoint.new
													tbl30[1] = v97
													tbl30[2] = v98

													do
														local values = table.pack(new(1, 1))
														table.move(values, 1, values.n, 3, tbl30)
													end

													tbl29.Transparency = numberSequence(tbl30)
													tbl29.Parent = parent
													v96("UIGradient", tbl29)

													fn56("UIStroke", {
														Thickness = 1,
														Color = Color3.fromRGB(255, 255, 255),
														Transparency = v82[152],
														ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
														Parent = parent,
													})
												end }

												tbl27 = {}
												flag19 = false

												do
													local tbl29 = {}
													local rotation = 0
													local n35 = 0

													service.RenderStepped:Connect(function(deltaTime)
														n35 += deltaTime or v82[46]
														if n35 < 0.033333333333333333 then
															return
														end
														local v96 = n35
														n35 = 0
														rotation = (rotation + (v96 or 0.016) * 130) % v82[136]

														for i = #tbl29, 1, -1 do
															local v97 = tbl29[i]

															if v97 and v97.Parent then
																local parent = v97.Parent

																if parent and parent.Parent and parent.Parent.Visible ~= false then
																	v97.Rotation = rotation
																end
															else
																table.remove(tbl29, i)
															end
														end
													end)

													tbl27.attach = function(arg)
														local v96 = fn56(v82[114], {
															Thickness = v82[65],
															Color = Color3.fromRGB(255, 255, 255),
															Transparency = 0.15,
															ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
															Parent = arg,
														})

														local v97 = fn56
														local tbl30 = {}
														local colorSequence = ColorSequence.new
														local tbl31 = {}
														local v98 = ColorSequenceKeypoint.new(0, Color3.fromRGB(168, 85, 247))
														local v99 = ColorSequenceKeypoint.new(0.2, Color3.fromRGB(v82[170], 50, 220))
														local v100 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(196, v82[84], 255))
														local v101 = ColorSequenceKeypoint.new(0.6, Color3.fromRGB(130, 40, v82[39]))
														local v102 = ColorSequenceKeypoint.new(v82[43], Color3.fromRGB(v82[194], 80, 250))
														local new = ColorSequenceKeypoint.new
														local color2 = Color3.fromRGB
														local v103 = v82[47]
														tbl31[1] = v98
														tbl31[2] = v99
														tbl31[3] = v100
														tbl31[4] = v101
														tbl31[5] = v102

														do
															local values = table.pack(new(1, color2(168, 85, v103)))
															table.move(values, 1, values.n, 6, tbl31)
														end

														tbl30.Color = colorSequence(tbl31)
														local numberSequence = NumberSequence.new
														local tbl32 = {}
														local v104 = NumberSequenceKeypoint.new(0, 0.05)
														local v105 = NumberSequenceKeypoint.new(0.5, v82[83])
														local new2 = NumberSequenceKeypoint.new
														local v106 = v82[103]
														tbl32[1] = v104
														tbl32[2] = v105

														do
															local values = table.pack(new2(v106, 0.05))
															table.move(values, 1, values.n, 3, tbl32)
														end

														tbl30.Transparency = numberSequence(tbl32)
														tbl30.Parent = v96
														local UIGradient = v97("UIGradient", tbl30)
														tbl29[#tbl29 + 1] = UIGradient

														return {
															stroke = v96,
															gradient = UIGradient,
															brighten = function(arg2, arg3)
																tbl11.to(v96, tbl11.Presets.Smooth, { Transparency = arg3 and v82[193] or 0.15, Thickness = arg3 and v82[159] or v82[65] })
															end,
															setAccent = function(arg2, arg3)
																local v107 = UIGradient
																local colorSequence2 = ColorSequence.new
																local tbl33 = {}
																local v108 = ColorSequenceKeypoint.new(v82[63], arg3 or Color3.fromRGB(v82[55], 85, v82[47]))
																local v109 = ColorSequenceKeypoint.new(0.33, Color3.fromRGB(150, 50, 220))
																local v110 = ColorSequenceKeypoint.new(0.66, Color3.fromRGB(196, 130, 255))
																local new3 = ColorSequenceKeypoint.new
																arg3 = arg3 or Color3.fromRGB(v82[55], 85, 247)
																local v111 = table.pack(new3(1, arg3))
																tbl33[1] = v108
																tbl33[2] = v109
																tbl33[3] = v110

																do
																	local values = table.pack(table.unpack(v111, 1, v111.n))
																	table.move(values, 1, values.n, 4, tbl33)
																end

																v107.Color = colorSequence2(tbl33)
															end,
															destroy = function()
																local v107 = table.find(tbl29, UIGradient)

																if v107 then
																	table.remove(tbl29, v107)
																end
															end,
														}
													end
												end
											end

											do
												tbl28 = { attach = function(arg, arg2, arg3)
													local n35 = arg3 or 12

													local Frame = fn56("Frame", {
														Name = "Particles",
														BackgroundTransparency = 1,
														Size = UDim2.fromScale(1, 1),
														ClipsDescendants = v82[173],
														ZIndex = v82[122],
														Parent = arg,
													})

													local tbl29 = {}

													for i = 1, n35 do
														local random2 = math.random
														local random3 = math.random
														local v96 = v82[106]

														tbl29[i] = {
															inst = fn56("ImageLabel", {
																Image = tbl19.Circle,
																BackgroundTransparency = 1,
																ImageColor3 = arg2,
																ImageTransparency = math.random(50, 82) / random3,
																Size = UDim2.fromOffset(math.random(2, 5), random2(2, 5)),
																Position = UDim2.fromScale(math.random(), random3()),
																ZIndex = 2,
																Parent = Frame,
															}),
															speed = math.random(v82[171], 8) / v96,
														}
													end

													local n36 = 0

													local connection = service.RenderStepped:Connect(function(deltaTime)
														if flag19 then
															return
														end
														n36 += deltaTime
														if n36 < v82[150] then
															return
														end
														local v96 = n36
														n36 = 0

														for _, v97 in ipairs(tbl29) do
															local position = v97.inst.Position
															local n37 = position.Y.Scale - v97.speed * v96

															if n37 < -0.05 then
																n37 = v82[9]
															end

															v97.inst.Position = UDim2.new(position.X.Scale, 0, n37, v82[63])
														end
													end)

													Frame.Destroying:Connect(function()
														if connection.Connected then
															connection:Disconnect()
														end
													end)

													return {
														layer = Frame,
														dots = tbl29,
														setAccent = function(arg4, imageColor3)
															for _, v96 in ipairs(tbl29) do
																v96.inst.ImageColor3 = imageColor3
															end
														end,
													}
												end }

												fn59 = function()
													for _, child in ipairs(service3:GetChildren()) do
														if child.Name == "GlassUIBlur" or child:IsA("BlurEffect") and child.Name:find("Glass") then
															pcall(function()
																child:Destroy()
															end)
														end
													end
												end

												fn59()

												do
													local function fn61(arg, arg2, arg3, arg4)
														local Frame = fn56("Frame", {
															BackgroundColor3 = arg4,
															BackgroundTransparency = 0.5,
															Size = UDim2.fromOffset(0, 0),
															AnchorPoint = Vector2.new(0.5, 0.5),
															Position = UDim2.fromOffset(arg2, arg3),
															ZIndex = 12,
															Parent = arg,
														}, { fn56(v82[140], { CornerRadius = UDim.new(1, 0) }) })

														tbl11.to(Frame, TweenInfo.new(v82[83], Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(240, v82[86]), BackgroundTransparency = v82[103] }).Completed:Connect(function()
															Frame:Destroy()
														end)
													end

													tbl12 = {
														_accentRail = function()
															return nil
														end,
														_hoverSurface = function(arg, arg2, arg3)
															arg.MouseEnter:Connect(function()
																tbl11.to(arg, tbl11.Presets.Snappy, { BackgroundTransparency = arg3 or 0.15 })
															end)

															arg.MouseLeave:Connect(function()
																local to = tbl11.to
																local snappy = tbl11.Presets.Snappy
																local tbl29 = {}
																local v96 = arg2
																local backgroundTransparency

																if arg2 then
																	backgroundTransparency = v96
																else
																	backgroundTransparency = 0.28
																end

																tbl29.BackgroundTransparency = backgroundTransparency
																to(arg, snappy, tbl29)
															end)
														end,
														Button = function(arg, arg2, arg3, arg4)
															local TextButton = fn56("TextButton", {
																Size = UDim2.new(1, v82[63], 0, v82[107]),
																BackgroundColor3 = arg.Data.Panel,
																AutoButtonColor = false,
																Text = "",
																ClipsDescendants = true,
																Parent = arg2,
															})

															fn57(11, TextButton)
															arg:Bind(TextButton, v82[178], "Panel")
															tbl26.apply(TextButton, { transparency = 0.2 })
															local v96 = tbl27.attach(TextButton, arg.Data.Accent)
															arg:BindAccent(v96.stroke, v82[35])
															v96.stroke.Transparency = 0.55
															tbl12._accentRail(arg, TextButton, 20)
															local v97 = v82[157]

															arg:Bind(fn56("TextLabel", {
																BackgroundTransparency = 1,
																Size = UDim2.fromScale(v82[103], 1),
																Font = Enum.Font.MontserratBold,
																Text = arg3,
																TextSize = 13,
																TextColor3 = Color3.fromRGB(v82[14], 255, v82[14]),
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = 5,
																Parent = TextButton,
															}), "TextColor3", v97)

															TextButton.MouseEnter:Connect(function()
																v96:brighten(true)
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.05 })
															end)

															TextButton.MouseLeave:Connect(function()
																v96:brighten(v82[139])
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.2 })
															end)

															TextButton.MouseButton1Down:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Snappy, { Size = UDim2.new(1, -4, v82[63], v82[96]) })
															end)

															TextButton.MouseButton1Up:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Spring, { Size = UDim2.new(1, 0, v82[63], v82[107]) })
															end)

															TextButton.MouseButton1Click:Connect(function()
																local mouseLocation = UserInputService:GetMouseLocation()
																fn61(TextButton, mouseLocation.X - TextButton.AbsolutePosition.X, mouseLocation.Y - TextButton.AbsolutePosition.Y, arg.Data.Accent)

																if arg4 then
																	task.spawn(arg4)
																end
															end)

															return TextButton
														end,
														Toggle = function(arg, arg2, arg3, arg4, arg5)
															local flag22 = arg4 or false

															local Frame = fn56("Frame", {
																Size = UDim2.new(1, 0, 0, v82[90]),
																BackgroundColor3 = arg.Data.Panel,
																ClipsDescendants = true,
																Parent = arg2,
															})

															fn57(11, Frame)
															tbl26.apply(Frame, { transparency = v82[56] })
															arg:Bind(Frame, "BackgroundColor3", v82[48])
															tbl12._accentRail(arg, Frame, 20)
															tbl12._hoverSurface(Frame, 0.28, v82[23])
															local v96 = v82[157]

															arg:Bind(fn56("TextLabel", {
																BackgroundTransparency = 1,
																Position = UDim2.fromOffset(v82[160], 0),
																Size = UDim2.new(1, -v82[22], 1, v82[63]),
																Font = Enum.Font.MontserratBold,
																Text = arg3,
																TextSize = 14,
																TextColor3 = Color3.fromRGB(255, 255, 255),
																TextXAlignment = Enum.TextXAlignment.Left,
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = v82[171],
																Parent = Frame,
															}), "TextColor3", v96)

															local Frame2 = fn56("Frame", {
																AnchorPoint = Vector2.new(1, 0.5),
																Position = UDim2.new(1, -14, 0.5, 0),
																Size = UDim2.fromOffset(v82[90], 24),
																BackgroundColor3 = Color3.fromRGB(v82[15], v82[81], 34),
																ZIndex = 3,
																Parent = Frame,
															})

															fn57(12, Frame2)
															local v97 = fn56(v82[114], { Thickness = 1.2, Color = arg.Data.Accent, Transparency = 0.65, Parent = Frame2 })
															arg:BindAccent(v97, "Color")

															local Frame3 = fn56("Frame", {
																BackgroundColor3 = Color3.fromRGB(v82[14], v82[14], 255),
																Size = UDim2.fromOffset(18, 18),
																Position = UDim2.fromOffset(v82[171], 3),
																ZIndex = v82[53],
																Parent = Frame2,
															}, { fn56(v82[140], { CornerRadius = UDim.new(v82[103], 0) }) })

															fn56("UIStroke", { Thickness = 1, Color = Color3.fromRGB(255, 255, 255), Transparency = 0.4, Parent = Frame3 })

															local function fn62(arg6)
																local spring = arg6 and tbl11.Presets.Spring or TweenInfo.new(0)
																local udim2 = flag22 and UDim2.fromOffset(25, 3) or UDim2.fromOffset(3, 3)

																tbl11.to(Frame2, spring, {
																	BackgroundColor3 = flag22 and (arg.Data.Accent or Color3.fromRGB(190, 32, 168)) or Color3.fromRGB(28, 24, 34),
																})

																tbl11.to(Frame3, spring, { Position = udim2 })
																tbl11.to(v97, spring, { Transparency = flag22 and 0.15 or 0.65 })
															end

															fn62(false)

															local TextButton = fn56("TextButton", {
																BackgroundTransparency = 1,
																Size = UDim2.fromScale(1, 1),
																Text = "",
																ZIndex = v82[70],
																Parent = Frame,
															})

															TextButton.MouseButton1Down:Connect(function()
																tbl11.to(Frame3, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(20, 16) })
															end)

															TextButton.MouseButton1Up:Connect(function()
																tbl11.to(Frame3, tbl11.Presets.Spring, { Size = UDim2.fromOffset(18, 18) })
															end)

															TextButton.MouseButton1Click:Connect(function()
																flag22 = not flag22
																fn62(true)

																if arg5 then
																	task.spawn(arg5, flag22)
																end
															end)

															return {
																setState = function(arg6)
																	flag22 = arg6
																	fn62(v82[173])
																end,
																getState = function()
																	return flag22
																end,
															}
														end,
														Slider = function(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
															local n35 = arg6 or arg4 or 0

															if arg8 and arg8 > v82[63] then
																local n36 = v82[21] ^ arg8
																n35 = math.floor(n35 * n36 + v82[6]) / n36
															end

															local Frame = fn56("Frame", {
																Size = UDim2.new(1, 0, v82[63], 44),
																BackgroundColor3 = arg.Data.Panel,
																ClipsDescendants = v82[173],
																Parent = arg2,
															})

															fn57(v82[21], Frame)
															tbl26.apply(Frame, { transparency = 0.25 })
															arg:Bind(Frame, "BackgroundColor3", "Panel")
															tbl12._hoverSurface(Frame, 0.25, 0.12)

															arg:Bind(fn56("TextLabel", {
																BackgroundTransparency = 1,
																Position = UDim2.fromOffset(v82[160], 0),
																Size = UDim2.new(v82[103], -v82[20], 1, v82[63]),
																Font = Enum.Font.MontserratBold,
																Text = arg3,
																TextSize = 14,
																TextColor3 = Color3.fromRGB(v82[14], 255, 255),
																TextXAlignment = Enum.TextXAlignment.Left,
																TextYAlignment = Enum.TextYAlignment.Center,
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = 3,
																Parent = Frame,
															}), "TextColor3", "Text")

															local Frame2 = fn56("Frame", {
																AnchorPoint = Vector2.new(1, v82[6]),
																Position = UDim2.new(v82[103], -v82[172], 0.5, 0),
																Size = UDim2.fromOffset(88, 28),
																BackgroundColor3 = arg.Data.Bg,
																BackgroundTransparency = 0.35,
																ZIndex = 3,
																Parent = Frame,
															})

															fn57(v82[73], Frame2)
															arg:Bind(Frame2, "BackgroundColor3", "Bg")

															local UIStroke = fn56("UIStroke", {
																Thickness = 1.2,
																Color = arg.Data.Accent,
																Transparency = 0.55,
																ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
																Parent = Frame2,
															})

															arg:BindAccent(UIStroke, "Color")

															local TextBox = fn56("TextBox", {
																Size = UDim2.fromScale(1, v82[103]),
																BackgroundTransparency = v82[103],
																Font = Enum.Font.MontserratBlack,
																Text = tostring(n35):gsub("%.", ","),
																TextSize = 14,
																TextColor3 = Color3.fromRGB(v82[14], 255, 255),
																TextXAlignment = Enum.TextXAlignment.Center,
																ClearTextOnFocus = false,
																PlaceholderText = v82[5],
																PlaceholderColor3 = Color3.fromRGB(150, 140, 165),
																ZIndex = 4,
																Parent = Frame2,
															})

															arg:BindAccent(TextBox, v82[197])

															local function fn62(arg9)
																if not arg9 then
																	return n35
																end
																local str8 = tostring(arg9):gsub(",", "."):gsub("[^0-9%.%-]", "")
																local num = tonumber(str8)
																if not num then
																	return n35
																end
																local n36

																if arg4 and arg5 and arg4 < arg5 then
																	n36 = math.clamp(num, arg4, arg5)
																else
																	n36 = num
																end

																local n37

																if arg8 and arg8 > 0 then
																	local n38 = 10 ^ arg8
																	n37 = math.floor(n36 * n38 + 0.5) / n38
																else
																	n37 = math.floor(n36 * v82[106] + v82[6]) / 100
																end

																return n37
															end

															local function fn63(arg9)
																if not arg9 then
																	return v82[5]
																end

																if arg9 == math.floor(arg9) then
																	return tostring(math.floor(arg9))
																end
																return tostring(arg9):gsub("%.", ",")
															end

															local function fn64(arg9, arg10)
																n35 = fn62(arg9)
																TextBox.Text = fn63(n35)

																if arg10 ~= false and arg7 then
																	task.spawn(arg7, n35)
																end
															end

															TextBox.Focused:Connect(function()
																if n27(3176) >= 16303 then
																	tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.05, Thickness = 1.8 })
																	tbl11.to(Frame2, tbl11.Presets.Snappy, { BackgroundTransparency = 0.15 })
																	return
																end

																while true do
																end
															end)

															TextBox.FocusLost:Connect(function()
																tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.55, Thickness = v82[184] })
																tbl11.to(Frame2, tbl11.Presets.Snappy, { BackgroundTransparency = 0.35 })
																fn64(TextBox.Text, true)
															end)

															fn64(n35, false)

															return {
																setValue = function(arg9)
																	fn64(arg9, v82[139])
																end,
																getValue = function()
																	return n35
																end,
															}
														end,
														Dropdown = function(arg, arg2, arg3, arg4, arg5, arg6)
															local v96 = arg4[1]

															if arg6 ~= nil then
																for _, v97 in ipairs(arg4) do
																	if v97 == arg6 then
																		v96 = arg6
																		break
																	end
																end
															end

															local flag22 = v82[139]

															local Frame = fn56("Frame", {
																Size = UDim2.new(1, 0, 0, 46),
																BackgroundColor3 = arg.Data.Panel,
																ClipsDescendants = v82[173],
																ZIndex = 3,
																Parent = arg2,
															})

															fn57(11, Frame)
															tbl26.apply(Frame, { transparency = 0.28 })
															arg:Bind(Frame, "BackgroundColor3", "Panel")
															tbl12._accentRail(arg, Frame, 20)
															tbl12._hoverSurface(Frame, 0.28, 0.15)

															local TextButton = fn56("TextButton", {
																BackgroundTransparency = 1,
																Size = UDim2.new(1, v82[63], v82[63], 46),
																Text = "",
																ZIndex = 4,
																Parent = Frame,
															})

															arg:Bind(fn56("TextLabel", {
																BackgroundTransparency = 1,
																Position = UDim2.fromOffset(14, 0),
																Size = UDim2.new(0.42, -12, v82[63], 46),
																Font = Enum.Font.MontserratBold,
																Text = arg3,
																TextSize = 14,
																TextColor3 = arg.Data.Sub,
																TextXAlignment = Enum.TextXAlignment.Left,
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = v82[53],
																Parent = TextButton,
															}), "TextColor3", "Sub")

															local TextLabel = fn56("TextLabel", {
																BackgroundTransparency = 1,
																Position = UDim2.new(0.42, 0, 0, 0),
																Size = UDim2.new(v82[99], -40, v82[63], 46),
																Font = Enum.Font.MontserratBold,
																Text = v96,
																TextSize = 13,
																TextColor3 = Color3.fromRGB(v82[69], 45, v82[147]),
																TextXAlignment = Enum.TextXAlignment.Right,
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = 4,
																Parent = TextButton,
															})

															arg:Bind(TextLabel, v82[197], "Text")
															local v97 = fn58(TextButton, arg.Data.Accent, 12)
															v97.AnchorPoint = Vector2.new(1, 0.5)
															v97.Position = UDim2.new(v82[103], -14, 0, 23)
															v97.ZIndex = v82[53]

															for _, child in ipairs(v97:GetChildren()) do
																if child:IsA(v82[95]) then
																	arg:BindAccent(child, "BackgroundColor3")
																end
															end

															local flag23 = #arg4 > v82[41]
															local n35 = flag23 and v82[74] or #arg4 * v82[169] + 4
															local ScrollingFrame

															if flag23 then
																ScrollingFrame = fn56("ScrollingFrame", {
																	BackgroundTransparency = v82[103],
																	Position = UDim2.fromOffset(v82[63], 46),
																	Size = UDim2.new(1, 0, 0, n35),
																	ScrollBarThickness = 2,
																	ScrollBarImageColor3 = arg.Data.Accent,
																	CanvasSize = UDim2.new(),
																	AutomaticCanvasSize = Enum.AutomaticSize.Y,
																	ZIndex = 4,
																	Parent = Frame,
																})

																arg:BindAccent(ScrollingFrame, v82[16])
															else
																ScrollingFrame = fn56(v82[95], {
																	BackgroundTransparency = 1,
																	Position = UDim2.fromOffset(0, 46),
																	Size = UDim2.new(v82[103], 0, 0, n35),
																	ZIndex = v82[53],
																	Parent = Frame,
																})
															end

															fn56(v82[64], { Padding = UDim.new(v82[63], 3), Parent = ScrollingFrame })

															fn56("UIPadding", {
																PaddingLeft = UDim.new(0, 6),
																PaddingRight = UDim.new(0, v82[41]),
																PaddingBottom = UDim.new(0, 6),
																Parent = ScrollingFrame,
															})

															local tbl29 = {}

															for _, v98 in ipairs(arg4) do
																local flag24 = v98 == v96

																local TextButton2 = fn56("TextButton", {
																	Size = UDim2.new(1, v82[63], v82[63], 30),
																	BackgroundColor3 = arg.Data.Bg,
																	BackgroundTransparency = flag24 and 0.15 or 0.35,
																	Font = Enum.Font.MontserratBold,
																	Text = "  " .. v98,
																	TextSize = 12,
																	TextColor3 = flag24 and Color3.fromRGB(v82[14], v82[14], 255) or Color3.fromRGB(220, 220, 230),
																	TextXAlignment = Enum.TextXAlignment.Left,
																	AutoButtonColor = false,
																	ZIndex = 5,
																	Parent = ScrollingFrame,
																})

																fn57(7, TextButton2)
																arg:Bind(TextButton2, v82[178], v82[31])

																local v99 = fn56(v82[114], {
																	Thickness = 1,
																	Color = arg.Data.Accent,
																	Transparency = flag24 and v82[75] or v82[18],
																	Parent = TextButton2,
																})

																arg:BindAccent(v99, "Color")
																tbl29[v98] = { btn = TextButton2, stroke = v99 }

																TextButton2.MouseEnter:Connect(function()
																	tbl11.to(TextButton2, tbl11.Presets.Snappy, { BackgroundTransparency = 0.1 })
																	tbl11.to(v99, tbl11.Presets.Snappy, { Transparency = 0.25 })
																end)

																TextButton2.MouseLeave:Connect(function()
																	local flag25 = v98 == v96
																	tbl11.to(TextButton2, tbl11.Presets.Snappy, { BackgroundTransparency = flag25 and 0.15 or 0.35 })
																	tbl11.to(v99, tbl11.Presets.Snappy, { Transparency = flag25 and 0.3 or 0.75 })
																end)

																TextButton2.MouseButton1Click:Connect(function()
																	v96 = v98
																	TextLabel.Text = v98
																	flag22 = false
																	Frame.ZIndex = v82[171]
																	tbl11.to(Frame, tbl11.Presets.Smooth, { Size = UDim2.new(1, 0, 0, 46) })
																	tbl11.to(v97, tbl11.Presets.Smooth, { Rotation = v82[63] })

																	for k, v100 in pairs(tbl29) do
																		local flag25 = k == v96
																		tbl11.to(v100.btn, tbl11.Presets.Snappy, { BackgroundTransparency = flag25 and 0.15 or v82[183] })
																		tbl11.to(v100.stroke, tbl11.Presets.Snappy, { Transparency = flag25 and v82[75] or 0.75 })
																	end

																	if arg5 then
																		task.spawn(arg5, v98)
																	end
																end)
															end

															TextButton.MouseButton1Click:Connect(function()
																flag22 = not flag22
																Frame.ZIndex = flag22 and 15 or 3
																tbl11.to(Frame, tbl11.Presets.Smooth, { Size = UDim2.new(1, v82[63], 0, flag22 and 46 + n35 + 6 or 46) })
																tbl11.to(v97, tbl11.Presets.Smooth, { Rotation = flag22 and 180 or 0 })
															end)

															return {
																getSelected = function()
																	return v96
																end,
																setSelected = function(text)
																	v96 = text
																	TextLabel.Text = text

																	for k, v98 in pairs(tbl29) do
																		local flag24 = k == v96
																		v98.btn.BackgroundTransparency = flag24 and 0.15 or 0.35
																		v98.stroke.Transparency = flag24 and 0.3 or 0.75
																	end
																end,
															}
														end,
													}
												end
											end

											do
												local tbl29 = {
													MouseButton1 = "M1",
													MouseButton2 = "M2",
													MouseButton3 = "M3",
													MouseButton4 = "M4",
													MouseButton5 = "M5",
													MouseBackButton = "M4",
													MouseForwardButton = "M5",
													F13 = "M4",
													F14 = "M5",
													F15 = "M6",
													ButtonA = v82[67],
													ButtonB = "B",
													ButtonX = "X",
													ButtonY = "Y",
													ButtonL1 = v82[179],
													ButtonR1 = "R1",
													ButtonL2 = v82[155],
													ButtonR2 = "R2",
													ButtonL3 = v82[111],
													ButtonR3 = "R3",
													ButtonSelect = "Sel",
													ButtonStart = "Strt",
													DPadUp = "Up",
													DPadDown = "Down",
													DPadLeft = "Left",
													DPadRight = "Right",
												}

												fn60 = function(arg)
													if type(arg) == "string" then
														return arg
													end
													return arg and arg.Name or nil
												end

												local function fn61(arg)
													local v96 = fn60(arg)
													if not v96 then
														return v82[185]
													end
													local match = v96:match("^MouseButton(%d+)$")
													if match then
														return v82[117] .. match
													end
													return tbl29[v96] or v96
												end

												fn30 = function(arg, arg2)
													if arg2 == nil or arg2 == Enum.KeyCode.None then
														return false
													end

													if type(arg2) ~= "string" then
														if arg.KeyCode ~= Enum.KeyCode.Unknown and arg.KeyCode == arg2 then
															return true
														end

														if arg.UserInputType ~= Enum.UserInputType.None and arg.UserInputType == arg2 then
															return v82[173]
														end
													end

													local v96 = fn60(arg2)
													if not v96 or v96 == "None" then
														return v82[139]
													end
													local userInputType = arg.UserInputType
													if v96:match("^MouseButton%d+$") then
														return userInputType ~= nil and userInputType.Name == v96
													end
													local keyCode = arg.KeyCode
													if keyCode ~= nil and keyCode ~= Enum.KeyCode.Unknown and keyCode ~= Enum.KeyCode.None and keyCode.Name == v96 then
														return true
													end
													return false
												end

												tbl12.Input = function(arg, arg2, arg3, arg4, arg5)
													local str8 = arg4 or ""

													local Frame = fn56("Frame", {
														Size = UDim2.new(v82[103], v82[63], v82[63], 46),
														BackgroundColor3 = arg.Data.Panel,
														ClipsDescendants = true,
														Parent = arg2,
													})

													fn57(v82[166], Frame)
													tbl26.apply(Frame, { transparency = 0.28 })
													arg:Bind(Frame, v82[178], "Panel")
													tbl12._accentRail(arg, Frame, v82[79])
													tbl12._hoverSurface(Frame, 0.28, v82[23])

													arg:Bind(fn56(v82[61], {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(v82[160], v82[63]),
														Size = UDim2.new(0.38, 0, v82[103], 0),
														Font = Enum.Font.MontserratBold,
														Text = arg3,
														TextSize = v82[160],
														TextColor3 = Color3.fromRGB(255, 255, 255),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 3,
														Parent = Frame,
													}), v82[197], "Text")

													local v96 = fn56(v82[128], {
														AnchorPoint = Vector2.new(v82[103], 0.5),
														Position = UDim2.new(1, -v82[172], 0.5, 0),
														Size = UDim2.new(0.56, v82[63], 0, 30),
														BackgroundColor3 = arg.Data.Bg,
														BackgroundTransparency = 0.3,
														Font = Enum.Font.MontserratBold,
														Text = str8,
														PlaceholderText = v82[91],
														TextSize = 12,
														TextColor3 = Color3.fromRGB(255, 255, 255),
														PlaceholderColor3 = Color3.fromRGB(v82[170], 150, 150),
														ClearTextOnFocus = false,
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.None,
														ClipsDescendants = true,
														ZIndex = v82[171],
														Parent = Frame,
													})

													fn57(8, v96)
													arg:Bind(v96, v82[178], "Bg")
													fn56(v82[120], { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), Parent = v96 })
													local v97 = tbl27.attach(v96, arg.Data.Accent)
													arg:BindAccent(v97.stroke, v82[35])
													v97.stroke.Transparency = v82[78]

													v96.Focused:Connect(function()
														v97:brighten(true)
													end)

													v96.FocusLost:Connect(function()
														v97:brighten(false)

														if arg5 then
															task.spawn(arg5, v96.Text)
														end
													end)

													return {
														getText = function()
															return v96.Text
														end,
														setText = function(text)
															v96.Text = text
														end,
													}
												end

												tbl12.Keybind = function(arg, arg2, arg3, arg4, arg5)
													local rightShift = arg4 or Enum.KeyCode.RightShift
													local flag22 = false

													local v96 = fn56(v82[95], {
														Size = UDim2.new(1, v82[63], 0, 46),
														BackgroundColor3 = arg.Data.Panel,
														ClipsDescendants = true,
														Parent = arg2,
													})

													fn57(11, v96)
													tbl26.apply(v96, { transparency = v82[56] })
													arg:Bind(v96, "BackgroundColor3", "Panel")
													tbl12._accentRail(arg, v96, 20)
													tbl12._hoverSurface(v96, 0.28, 0.15)

													arg:Bind(fn56(v82[61], {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(14, 0),
														Size = UDim2.new(1, -119, 1, v82[63]),
														Font = Enum.Font.MontserratBold,
														Text = arg3,
														TextSize = v82[160],
														TextColor3 = Color3.fromRGB(255, 255, v82[14]),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 3,
														Parent = v96,
													}), "TextColor3", "Text")

													local v97 = fn56(v82[104], {
														AnchorPoint = Vector2.new(1, v82[6]),
														Position = UDim2.new(v82[103], -12, v82[6], 0),
														Size = UDim2.fromOffset(26, 26),
														BackgroundColor3 = Color3.fromRGB(32, v82[21], 26),
														BackgroundTransparency = 0.25,
														AutoButtonColor = v82[139],
														Font = Enum.Font.MontserratBlack,
														Text = "X",
														TextSize = 13,
														TextColor3 = Color3.fromRGB(v82[14], v82[156], v82[20]),
														ZIndex = 4,
														Parent = v96,
													})

													fn57(7, v97)
													local UIStroke = fn56("UIStroke", { Thickness = 1.2, Color = Color3.fromRGB(255, 65, v82[20]), Transparency = v82[6], Parent = v97 })

													v97.MouseEnter:Connect(function()
														tbl11.to(v97, tbl11.Presets.Snappy, {
															BackgroundColor3 = Color3.fromRGB(65, v82[3], 45),
															BackgroundTransparency = v82[51],
															Size = UDim2.fromOffset(28, 28),
															TextColor3 = Color3.fromRGB(255, v82[109], v82[163]),
														})

														tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.05, Color = Color3.fromRGB(255, 100, 150) })
													end)

													v97.MouseLeave:Connect(function()
														tbl11.to(v97, tbl11.Presets.Snappy, {
															BackgroundColor3 = Color3.fromRGB(v82[118], v82[21], 26),
															BackgroundTransparency = 0.25,
															Size = UDim2.fromOffset(26, 26),
															TextColor3 = Color3.fromRGB(255, 65, v82[20]),
														})

														tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.5, Color = Color3.fromRGB(255, 65, 115) })
													end)

													local TextButton = fn56("TextButton", {
														AnchorPoint = Vector2.new(v82[103], 0.5),
														Position = UDim2.new(1, -v82[33], 0.5, v82[63]),
														Size = UDim2.fromOffset(66, 28),
														BackgroundColor3 = arg.Data.Bg,
														BackgroundTransparency = 0.3,
														AutoButtonColor = false,
														Font = Enum.Font.MontserratBold,
														Text = fn61(rightShift),
														TextSize = 13,
														TextColor3 = Color3.fromRGB(v82[69], 45, 185),
														ZIndex = 3,
														Parent = v96,
													})

													fn57(8, TextButton)
													arg:Bind(TextButton, "BackgroundColor3", "Bg")
													arg:BindAccent(TextButton, "TextColor3")
													TextButton.Name = "HookKeybindBox"

													pcall(function()
														TextButton.Selectable = true
													end)

													pcall(function()
														v97.Selectable = false
													end)

													pcall(function()
														game:GetService("GuiService").GuiNavigationEnabled = true
													end)

													local v98 = tbl27.attach(TextButton, arg.Data.Accent)
													arg:BindAccent(v98.stroke, "Color")
													v98.stroke.Transparency = 0.55

													TextButton.MouseEnter:Connect(function()
														if not flag22 then
															v98:brighten(true)
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.1 })
														end
													end)

													TextButton.MouseLeave:Connect(function()
														if not flag22 then
															v98:brighten(false)
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[75] })
														end
													end)

													v97.MouseButton1Click:Connect(function()
														flag22 = false
														flag18 = false

														pcall(function()
															game:GetService("GuiService").SelectedObject = nil
														end)

														rightShift = Enum.KeyCode.None
														TextButton.Text = "None"
														v98:brighten(v82[139])

														if arg5 then
															task.spawn(arg5, Enum.KeyCode.None)
														end
													end)

													TextButton.MouseButton1Click:Connect(function()
														flag22 = true
														flag18 = v82[173]
														TextButton.Text = v82[138]
														v98:brighten(true)
													end)

													local connection = UserInputService.InputBegan:Connect(function(input)
														if not flag22 then
															return
														end
														local userInputType = input.UserInputType
														local keyCode

														if userInputType == Enum.UserInputType.Keyboard then
															if input.KeyCode == Enum.KeyCode.Escape then
																flag22 = false
																flag18 = false
																TextButton.Text = fn61(rightShift)
																v98:brighten(false)

																pcall(function()
																	game:GetService(v82[113]).SelectedObject = nil
																end)

																return
															end

															keyCode = input.KeyCode
														elseif input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name:match("^Mouse") then
															keyCode = input.KeyCode.Name
														elseif userInputType.Name:match("^MouseButton%d+$") and userInputType.Name ~= "MouseButton1" then
															keyCode = userInputType.Name
														elseif (userInputType.Name:find("Gamepad") or userInputType == Enum.UserInputType.Gamepad1 or userInputType == Enum.UserInputType.Gamepad2 or userInputType == Enum.UserInputType.Gamepad3 or userInputType == Enum.UserInputType.Gamepad4) and input.KeyCode ~= Enum.KeyCode.Unknown then
															keyCode = input.KeyCode
														else
															keyCode = nil

															if input.KeyCode ~= Enum.KeyCode.Unknown then
																keyCode = input.KeyCode
															end
														end

														if keyCode then
															rightShift = keyCode
															TextButton.Text = fn61(rightShift)
															flag22 = false
															flag18 = v82[139]
															v98:brighten(false)

															pcall(function()
																game:GetService("GuiService").SelectedObject = nil
															end)

															if arg5 then
																task.spawn(arg5, rightShift)
															end
														end
													end)

													v96.Destroying:Connect(function()
														if connection.Connected then
															connection:Disconnect()
														end
													end)

													return {
														getKey = function()
															return rightShift
														end,
														setKey = function(arg6)
															rightShift = arg6
															TextButton.Text = fn61(arg6)
														end,
													}
												end
											end
										end

										do
											local HttpService, flag22

											do
												do
													tbl12.Stepper = function(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
														local n35 = arg7 or arg4

														local v96 = fn56(v82[95], {
															Size = UDim2.new(v82[103], 0, 0, v82[88]),
															BackgroundColor3 = arg.Data.Panel,
															ClipsDescendants = true,
															Parent = arg2,
														})

														fn57(11, v96)
														tbl26.apply(v96, { transparency = 0.28 })
														arg:Bind(v96, "BackgroundColor3", "Panel")
														tbl12._accentRail(arg, v96, v82[79])
														tbl12._hoverSurface(v96, 0.28, v82[23])
														local v97 = v82[197]

														arg:Bind(fn56(v82[61], {
															BackgroundTransparency = v82[103],
															Position = UDim2.fromOffset(v82[160], v82[171]),
															Size = UDim2.new(v82[103], -v82[164], v82[63], 23),
															Font = Enum.Font.MontserratBold,
															Text = arg3,
															TextSize = 14,
															TextColor3 = Color3.fromRGB(255, v82[14], 255),
															TextXAlignment = Enum.TextXAlignment.Left,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = 3,
															Parent = v96,
														}), v97, "Text")

														local Frame = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, v82[103]),
															Position = UDim2.new(0.5, 0, 1, -6),
															Size = UDim2.new(v82[103], -24, v82[63], 28),
															BackgroundColor3 = arg.Data.Bg,
															BackgroundTransparency = 0.45,
															ZIndex = 3,
															Parent = v96,
														})

														fn57(v82[146], Frame)
														arg:Bind(Frame, v82[178], "Bg")
														fn56("UIStroke", { Thickness = v82[184], Color = Color3.fromRGB(195, 20, 155), Transparency = 0.65, Parent = Frame })

														local v98 = fn56(v82[61], {
															AnchorPoint = Vector2.new(0.5, 0.5),
															Position = UDim2.fromScale(0.5, 0.5),
															Size = UDim2.new(1, -72, 1, v82[63]),
															BackgroundTransparency = 1,
															Font = Enum.Font.MontserratBold,
															Text = tostring(n35),
															TextSize = 14,
															TextColor3 = Color3.fromRGB(225, v82[176], 185),
															ZIndex = v82[53],
															Parent = Frame,
														})

														arg:BindAccent(v98, "TextColor3")

														local function fn61(arg9)
															local TextButton = fn56("TextButton", {
																Size = UDim2.fromOffset(28, 28),
																BackgroundColor3 = arg.Data.Bg,
																BackgroundTransparency = 0.2,
																AutoButtonColor = false,
																Text = "",
																ZIndex = 4,
																Parent = Frame,
															})

															TextButton.AnchorPoint = Vector2.new(arg9 == v82[59] and v82[63] or 1, 0.5)
															TextButton.Position = arg9 == "minus" and UDim2.new(0, v82[63], 0.5, 0) or UDim2.new(1, 0, 0.5, v82[63])
															fn57(v82[73], TextButton)
															arg:Bind(TextButton, v82[178], "Bg")
															local UIStroke = fn56("UIStroke", { Thickness = 1, Color = arg.Data.Accent, Transparency = 0.7, Parent = TextButton })
															arg:BindAccent(UIStroke, v82[35])

															arg:BindAccent(fn56(v82[95], {
																AnchorPoint = Vector2.new(0.5, 0.5),
																Position = UDim2.fromScale(0.5, 0.5),
																Size = UDim2.fromOffset(v82[172], 2),
																BackgroundColor3 = arg.Data.Accent,
																BorderSizePixel = 0,
																ZIndex = v82[70],
																Parent = TextButton,
															}, { fn56("UICorner", { CornerRadius = UDim.new(1, 0) }) }), "BackgroundColor3")

															if arg9 == v82[76] then
																arg:BindAccent(fn56("Frame", {
																	AnchorPoint = Vector2.new(v82[6], 0.5),
																	Position = UDim2.fromScale(v82[6], v82[6]),
																	Size = UDim2.fromOffset(2, 12),
																	BackgroundColor3 = arg.Data.Accent,
																	BorderSizePixel = 0,
																	ZIndex = 5,
																	Parent = TextButton,
																}, { fn56("UICorner", { CornerRadius = UDim.new(1, 0) }) }), "BackgroundColor3")
															end

															TextButton.MouseEnter:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0 })
																tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.25 })
															end)

															TextButton.MouseLeave:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.2 })
																tbl11.to(UIStroke, tbl11.Presets.Snappy, { Transparency = 0.7 })
															end)

															TextButton.MouseButton1Down:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(v82[81], 24) })
															end)

															TextButton.MouseButton1Up:Connect(function()
																tbl11.to(TextButton, tbl11.Presets.Spring, { Size = UDim2.fromOffset(28, 28) })
															end)

															return TextButton
														end

														local minus = fn61("minus")
														local plus = fn61("plus")

														local function fn62()
															n35 = math.clamp(n35, arg4, arg5)
															v98.Text = tostring(n35)

															if arg8 then
																task.spawn(arg8, n35)
															end
														end

														minus.MouseButton1Click:Connect(function()
															n35 -= arg6
															fn62()
														end)

														plus.MouseButton1Click:Connect(function()
															n35 += arg6
															fn62()
														end)

														return {
															setValue = function(arg9)
																n35 = arg9
																fn62()
															end,
															getValue = function()
																return n35
															end,
														}
													end

													do
														local tbl29 = { init = function()
															return { push = function()
															end }
														end }

														local index3 = {}
														index3.__index = index3

														index3.new = function(gui, theme)
															local obj = setmetatable({}, index3)
															obj.gui = gui
															obj.theme = theme
															obj.locked = v82[139]
															obj.scale = v82[103]
															obj.buttons = {}
															obj.base = { w = 68, h = v82[25], gap = v82[21], font = 10 }
															obj._conns = {}
															obj._press = nil
															obj.onPositionChanged = nil
															obj:_setupInput()

															gui.Destroying:Connect(function()
																for _, conn in ipairs(obj._conns) do
																	if conn.Connected then
																		conn:Disconnect()
																	end
																end
															end)

															return obj
														end

														index3._layout = function(arg)
															local currentCamera = workspace.CurrentCamera
															currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, v82[8])

															if currentCamera.X < 200 or currentCamera.Y < 200 then
																currentCamera = Vector2.new(1280, 720)
															end

															local base = arg.base
															local scale = arg.scale
															local n35 = #arg.buttons
															if n35 == 0 then
																return
															end
															local n36 = base.w * scale
															local n37 = base.h * scale
															local n38 = (base.gap or 10) * scale
															local v96 = math.ceil(n35 / (n35 > v82[70] and 2 or 1))
															local n39 = currentCamera.X - 18 - n36 / 2
															local n40 = math.clamp(currentCamera.Y / 2 - (v96 * n37 + math.max(0, v96 - v82[103]) * n38) / 2 + n37 / 2, v82[186], currentCamera.Y - 60)

															for i, button in ipairs(arg.buttons) do
																local floor2 = math.floor
																button.btn.Position = UDim2.fromOffset(math.floor(n39 - math.floor((i - 1) / v96) * (n36 + n38)), floor2(n40 + (i - 1) % v96 * (n37 + n38)))
															end
														end

														local tbl30 = {
															["Neon Violet Glass"] = {
																normalBg = Color3.fromRGB(v82[63], 0, 0),
																normalTrans = 0,
																activeBg = Color3.fromRGB(150, 50, 255),
																activeTrans = 0,
																normalText = Color3.fromRGB(v82[14], 255, v82[14]),
																activeText = Color3.fromRGB(12, 2, 14),
																normalStroke = Color3.fromRGB(168, 85, 247),
																normalStrokeTrans = v82[78],
																activeStroke = Color3.fromRGB(255, 255, v82[14]),
																activeStrokeTrans = 0.1,
																corner = 0.28,
																font = Enum.Font.MontserratBlack,
															},
															[v82[198]] = {
																normalBg = Color3.fromRGB(0, 0, 0),
																normalTrans = v82[63],
																activeBg = Color3.fromRGB(168, 85, v82[47]),
																activeTrans = 0,
																normalText = Color3.fromRGB(255, v82[14], 255),
																activeText = Color3.fromRGB(0, v82[63], 0),
																normalStroke = Color3.fromRGB(40, v82[33], 45),
																normalStrokeTrans = 0.4,
																activeStroke = Color3.fromRGB(v82[74], 140, 255),
																activeStrokeTrans = 0.1,
																corner = 0.24,
																font = Enum.Font.MontserratBold,
															},
															["Minimal Pill"] = {
																normalBg = Color3.fromRGB(22, v82[172], 26),
																normalTrans = v82[75],
																activeBg = Color3.fromRGB(190, 32, v82[55]),
																activeTrans = 0,
																normalText = Color3.fromRGB(240, 240, 250),
																activeText = Color3.fromRGB(255, 255, 255),
																normalStroke = Color3.fromRGB(120, 40, v82[84]),
																normalStrokeTrans = 0.6,
																activeStroke = Color3.fromRGB(v82[14], 100, v82[145]),
																activeStrokeTrans = v82[190],
																corner = v82[6],
																font = Enum.Font.MontserratBold,
															},
															[v82[57]] = {
																normalBg = Color3.fromRGB(8, 8, v82[172]),
																normalTrans = 0.05,
																activeBg = Color3.fromRGB(140, 30, v82[145]),
																activeTrans = 0,
																normalText = Color3.fromRGB(255, v82[14], 255),
																activeText = Color3.fromRGB(255, v82[14], 255),
																normalStroke = Color3.fromRGB(80, v82[79], v82[37]),
																normalStrokeTrans = v82[130],
																activeStroke = Color3.fromRGB(v82[14], 255, 255),
																activeStrokeTrans = 0.05,
																corner = 0.16,
																font = Enum.Font.MontserratBlack,
															},
															[v82[80]] = {
																normalBg = Color3.fromRGB(12, 4, 18),
																normalTrans = 0.15,
																activeBg = Color3.fromRGB(v82[39], v82[29], v82[147]),
																activeTrans = v82[63],
																normalText = Color3.fromRGB(225, 160, 255),
																activeText = Color3.fromRGB(255, v82[14], 255),
																normalStroke = Color3.fromRGB(190, 32, v82[55]),
																normalStrokeTrans = 0.3,
																activeStroke = Color3.fromRGB(255, v82[14], 255),
																activeStrokeTrans = v82[63],
																corner = 0.28,
																font = Enum.Font.MontserratBlack,
															},
														}

														index3.setStyle = function(arg, currentStyle)
															arg.currentStyle = currentStyle

															for _, button in ipairs(arg.buttons) do
																if button.render then
																	button.render(button.state, true)
																end
															end
														end

														index3.addButton = function(arg, arg2, arg3, arg4)
															if arg4 == nil then
																arg4 = true
															end

															local n35 = arg.base.w * arg.scale
															local n36 = arg.base.h * arg.scale

															local TextButton = fn56("TextButton", {
																AnchorPoint = Vector2.new(v82[6], 0.5),
																Size = UDim2.fromOffset(n35, n36),
																BackgroundColor3 = Color3.fromRGB(0, v82[63], 0),
																BackgroundTransparency = 0,
																AutoButtonColor = v82[139],
																Text = "",
																ClipsDescendants = true,
																ZIndex = v82[58],
																Parent = arg.gui,
															})

															local v96 = fn56(v82[140], { CornerRadius = UDim.new(v82[56], v82[63]), Parent = TextButton })
															local UIScale = fn56("UIScale", { Scale = 1, Parent = TextButton })
															local v97 = tbl27.attach(TextButton, Color3.fromRGB(25, 25, v82[134]))
															v97.stroke.Transparency = 0.65

															local TextLabel = fn56("TextLabel", {
																BackgroundTransparency = v82[103],
																Position = UDim2.new(v82[63], v82[53], 0, 4),
																Size = UDim2.new(1, -v82[73], 1, -v82[73]),
																Font = Enum.Font.MontserratBlack,
																Text = arg2,
																TextSize = math.max(8, arg.base.font * arg.scale),
																TextColor3 = Color3.fromRGB(255, 255, 255),
																TextXAlignment = Enum.TextXAlignment.Center,
																TextYAlignment = Enum.TextYAlignment.Center,
																TextWrapped = true,
																ZIndex = v82[107],
																Parent = TextButton,
															})

															local function fn61(arg5, arg6)
																local snappy = arg6 and tbl11.Presets.Snappy or TweenInfo.new(0)
																local mobileBtnStyle = State and State.mobileBtnStyle and tbl30[State.mobileBtnStyle] or tbl30[v82[28]]
																local activeBg = arg5 and mobileBtnStyle.activeBg or mobileBtnStyle.normalBg
																local activeTrans = arg5 and mobileBtnStyle.activeTrans or mobileBtnStyle.normalTrans
																local activeText = arg5 and mobileBtnStyle.activeText or mobileBtnStyle.normalText
																v96.CornerRadius = UDim.new(mobileBtnStyle.corner or 0.28, v82[63])
																TextLabel.Font = mobileBtnStyle.font or Enum.Font.MontserratBlack
																tbl11.to(TextButton, snappy, { BackgroundColor3 = activeBg, BackgroundTransparency = activeTrans })
																tbl11.to(TextLabel, snappy, { TextColor3 = activeText })

																if v97 and v97.stroke then
																	v97.stroke.Color = arg5 and mobileBtnStyle.activeStroke or mobileBtnStyle.normalStroke
																	v97.stroke.Transparency = arg5 and mobileBtnStyle.activeStrokeTrans or mobileBtnStyle.normalStrokeTrans
																end
															end

															local tbl31 = {
																btn = TextButton,
																label = TextLabel,
																pressScale = UIScale,
																ol = v97,
																corner = v96,
																state = false,
																hovered = false,
																text = arg2,
																callback = arg3,
																isToggle = arg4,
																applyScale = function(arg5)
																	TextLabel.Size = UDim2.new(1, -v82[73] * arg5, v82[103], -v82[73] * arg5)
																	TextLabel.TextSize = math.max(8, arg.base.font * arg5)
																end,
																render = fn61,
															}

															tbl31.applyScale(arg.scale)

															tbl31.setState = function(arg5)
																if not tbl31.isToggle then
																	return
																end
																tbl31.state = not not arg5
																fn61(tbl31.state, false)
															end

															tbl31.toggle = function()
																if not tbl31.isToggle then
																	fn61(true, true)

																	task.delay(0.2, function()
																		fn61(v82[139], true)
																	end)

																	if arg3 then
																		task.spawn(arg3, v82[173])
																	end

																	return
																end

																tbl31.state = not tbl31.state
																fn61(tbl31.state, true)

																if arg3 then
																	task.spawn(arg3, tbl31.state)
																end
															end

															fn61(v82[139], false)

															TextButton.MouseEnter:Connect(function()
																tbl31.hovered = true

																if not tbl31._pressed then
																	tbl11.to(UIScale, tbl11.Presets.Snappy, { Scale = v82[143] })
																end
															end)

															TextButton.MouseLeave:Connect(function()
																tbl31.hovered = false

																if not tbl31._pressed then
																	tbl11.to(UIScale, tbl11.Presets.Snappy, { Scale = 1 })
																end
															end)

															TextButton.InputBegan:Connect(function(input)
																if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
																	tbl31._pressed = true
																	TextButton.ZIndex = 43
																	arg._press = { entry = tbl31, start = input.Position, startPos = TextButton.Position, moved = v82[139] }
																	tbl11.to(UIScale, tbl11.Presets.Snappy, { Scale = v82[165] })
																end

																if not (v82[174] < n25) then
																	return
																end

																while true do
																end
															end)

															table.insert(arg.buttons, tbl31)
															arg:_layout()
															return tbl31
														end

														index3._setupInput = function(arg)
															table.insert(arg._conns, UserInputService.InputChanged:Connect(function(input)
																if arg._press and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
																	local n35 = input.Position - arg._press.start

																	if not arg.locked and n35.Magnitude > 6 then
																		arg._press.moved = true
																		local startPos = arg._press.startPos
																		arg._press.entry.btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + n35.X, startPos.Y.Scale, startPos.Y.Offset + n35.Y)
																	end
																end
															end))

															table.insert(arg._conns, UserInputService.InputEnded:Connect(function(input)
																if arg._press and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
																	local entry = arg._press.entry
																	entry._pressed = v82[139]
																	entry.btn.ZIndex = 41
																	tbl11.to(entry.pressScale, tbl11.Presets.Spring, { Scale = entry.hovered and 1.035 or 1 })
																	local moved = arg._press.moved

																	if not moved then
																		entry.toggle()
																	end

																	arg._press = nil

																	if moved and arg.onPositionChanged then
																		pcall(arg.onPositionChanged)
																	end
																end
															end))
														end

														index3.getPositions = function(arg)
															local tbl31 = {}

															for _, button in ipairs(arg.buttons) do
																local position = button.btn.Position
																tbl31[button.text] = { x = math.floor(position.X.Offset + 0.5), y = math.floor(position.Y.Offset + 0.5) }
															end

															return tbl31
														end

														index3.setPositions = function(arg, arg2)
															if type(arg2) ~= "table" then
																return
															end

															for _, button in ipairs(arg.buttons) do
																local v96 = arg2[button.text]

																if type(v96) == "table" and tonumber(v96.x) and tonumber(v96.y) then
																	button.btn.Position = UDim2.fromOffset(tonumber(v96.x), tonumber(v96.y))
																end
															end
														end

														index3.resetPositions = function(arg)
															arg:_layout()
														end

														index3.setLocked = function(arg, locked)
															arg.locked = locked
														end

														index3.setButtonVisible = function(arg, arg2, arg3)
															for _, button in ipairs(arg.buttons) do
																if button.text == arg2 then
																	button.visibleSetting = arg3 ~= v82[139]
																	button.btn.Visible = arg.visible ~= false and button.visibleSetting
																end
															end
														end

														index3.setVisible = function(arg, arg2)
															arg.visible = arg2 ~= false

															for _, button in ipairs(arg.buttons) do
																button.btn.Visible = arg.visible and button.visibleSetting ~= false
															end
														end

														index3.setScale = function(arg, arg2)
															arg.scale = math.clamp(arg2, 0.5, 2)
															local n35 = arg.base.w * arg.scale
															local n36 = arg.base.h * arg.scale

															for _, button in ipairs(arg.buttons) do
																if not button._pressed then
																	button.btn.Size = UDim2.fromOffset(n35, n36)
																end

																if button.applyScale then
																	button.applyScale(arg.scale)
																end

																if button.render then
																	button.render(button.state, v82[139])
																end
															end
														end

														index3.applyTheme = function(arg)
															for _, button in ipairs(arg.buttons) do
																if button.render then
																	button.render(button.state, v82[173])
																end
															end
														end

														tbl20 = nil
														_G.HD_RESETTING = false
														fn31 = nil
														index = {}
														index.__index = index

														index.new = function(arg)
															local tbl31 = arg or {}
															local obj = setmetatable({}, index)
															obj.theme = index2.new(tbl31.theme or "Midnight")
															obj.tabs = {}
															obj.activeTab = nil
															obj._conns = {}
															obj.minW = 400
															obj.minH = 360
															obj._bgIndex = tbl31.background or 1
															obj.bgTransparency = tbl31.imageTransparency or 0.5
															local playerGui2 = localPlayer:WaitForChild("PlayerGui")
															local v96 = playerGui2:FindFirstChild(v82[158])

															if v96 then
																v96:Destroy()
															end

															fn59()
															obj._playerGui = playerGui2

															obj.gui = fn56(v82[11], {
																Name = "GlassUI",
																ResetOnSpawn = false,
																IgnoreGuiInset = true,
																ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
																Parent = playerGui2,
															})

															local width = tbl31.width or 560
															local height = tbl31.height or 660
															obj._w = width
															obj._h = height
															local h = obj._h
															obj._baseW = obj._w
															obj._baseH = h

															obj.main = fn56("Frame", {
																Name = v82[93],
																AnchorPoint = Vector2.new(0.5, 0.5),
																Position = UDim2.fromScale(0.5, 0.5),
																Size = UDim2.fromOffset(obj._w, obj._h),
																BackgroundColor3 = Color3.fromRGB(12, 3, 12),
																BackgroundTransparency = v82[51],
																ClipsDescendants = true,
																Parent = obj.gui,
															})

															obj.scaleInstance = fn56(v82[49], { Scale = 1, Parent = obj.main })
															fn57(30, obj.main)

															obj.bg = fn56("ImageLabel", {
																Name = "Backdrop",
																BackgroundTransparency = 1,
																Image = tbl19.Backgrounds[1] or "",
																ScaleType = Enum.ScaleType.Crop,
																Position = UDim2.new(v82[63], -v82[60], 0, 0),
																Size = UDim2.new(1, 600, v82[103], v82[63]),
																ImageTransparency = 0,
																ZIndex = v82[103],
																Parent = obj.main,
															})

															fn57(v82[134], obj.bg)

															task.spawn(function()
																for i = v82[103], 3 do
																	local png = fn55("https://files.catbox.moe/a2goit.png", "hookduels_bg_custom.png")

																	if obj.bg and png and png ~= "" then
																		obj.bg.Image = png
																		break
																	else
																		task.wait(v82[6])
																	end
																end
															end)

															local Frame = fn56("Frame", {
																Name = v82[175],
																BackgroundColor3 = Color3.fromRGB(10, 2, 10),
																BackgroundTransparency = 0.45,
																BorderSizePixel = 0,
																Size = UDim2.fromScale(1, 1),
																ZIndex = 2,
																Parent = obj.main,
															})

															fn57(30, Frame)
															local v97 = fn56
															local tbl32 = { Rotation = v82[110] }
															local numberSequence = NumberSequence.new
															local tbl33 = {}
															local v98 = NumberSequenceKeypoint.new(v82[63], 0.35)
															local v99 = NumberSequenceKeypoint.new(0.6, 0.25)
															tbl33[1] = v98
															tbl33[2] = v99

															do
																local values = table.pack(NumberSequenceKeypoint.new(1, v82[23]))
																table.move(values, 1, values.n, 3, tbl33)
															end

															tbl32.Transparency = numberSequence(tbl33)
															tbl32.Parent = Frame
															v97("UIGradient", tbl32)
															obj.outline = tbl27.attach(obj.main, obj.theme.Data.Accent)
															obj.theme:BindAccent(obj.outline.stroke, "Color")
															obj.outline.stroke.Transparency = 0.05
															obj.outline.stroke.Thickness = 2.2
															obj.particles = tbl28.attach(obj.main, obj.theme.Data.Accent, 20)
															obj.notify = tbl29.init(obj.gui, obj.theme)
															obj.sidebar = index3.new(obj.gui, obj.theme)
															obj.layout = tbl31.layout or 1
															obj:_buildChrome(tbl31)
															obj:_setupDrag()
															obj:_setupResize()
															return obj
														end
													end
												end

												index._buildChrome = function(arg)
													local theme = arg.theme

													arg.titleBar = fn56("Frame", {
														Name = "TitleBar",
														Size = UDim2.new(1, v82[63], 0, 58),
														BackgroundTransparency = v82[103],
														ZIndex = 5,
														Parent = arg.main,
													})

													local ImageLabel = fn56("ImageLabel", {
														Name = "Logo",
														Size = UDim2.fromOffset(34, 34),
														Position = UDim2.fromOffset(15, 12),
														BackgroundTransparency = 1,
														Image = fn55("https://files.catbox.moe/et2mq4.png", v82[34]),
														ScaleType = Enum.ScaleType.Fit,
														ZIndex = v82[41],
														Parent = arg.titleBar,
													})

													fn57(v82[21], ImageLabel)

													local Frame = fn56("Frame", {
														Name = v82[85],
														Size = UDim2.fromOffset(40, 40),
														Position = UDim2.fromOffset(v82[172], v82[146]),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.25,
														BorderSizePixel = 0,
														ZIndex = 5,
														Parent = arg.titleBar,
													})

													fn57(12, Frame)
													theme:Bind(Frame, "BackgroundColor3", v82[48])
													theme:BindAccent(fn56(v82[114], { Thickness = 1.2, Color = theme.Data.Accent, Transparency = 0.45, Parent = Frame }), "Color")

													task.spawn(function()
														local png = fn55("https://files.catbox.moe/et2mq4.png", v82[34])

														if ImageLabel and png and png ~= "" then
															ImageLabel.Image = png
														end
													end)

													theme:BindAccent(fn56(v82[61], {
														BackgroundTransparency = v82[103],
														Position = UDim2.fromOffset(58, v82[21]),
														Size = UDim2.new(v82[103], -170, 0, v82[79]),
														Font = Enum.Font.MontserratBlack,
														Text = "Hook Duels",
														TextSize = 17,
														TextColor3 = Color3.fromRGB(255, 255, 255),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 6,
														Parent = arg.titleBar,
													}), "TextColor3")

													theme:Bind(fn56("TextLabel", {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(58, 30),
														Size = UDim2.new(1, -v82[87], 0, 15),
														Font = Enum.Font.MontserratBold,
														Text = "discord.gg/hookduels",
														TextSize = 11,
														TextColor3 = Color3.fromRGB(192, 132, v82[123]),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 6,
														Parent = arg.titleBar,
													}), v82[197], v82[77])

													local v96 = fn56(v82[104], {
														Name = "MinimizeBtn",
														AnchorPoint = Vector2.new(1, 0.5),
														Position = UDim2.new(1, -v82[137], v82[6], 0),
														Size = UDim2.fromOffset(32, 32),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = v82[36],
														AutoButtonColor = false,
														Font = Enum.Font.MontserratBold,
														Text = "—",
														TextSize = 16,
														TextColor3 = Color3.fromRGB(v82[14], 255, 255),
														ZIndex = 7,
														Parent = arg.titleBar,
													})

													fn57(8, v96)
													theme:Bind(v96, "BackgroundColor3", "Panel")
													local v97 = v82[35]
													theme:BindAccent(fn56("UIStroke", { Thickness = v82[184], Color = theme.Data.Accent, Transparency = 0.6, Parent = v96 }), v97)

													v96.MouseButton1Click:Connect(function()
														arg:minimize()
														v96.Text = arg._minimized and "+" or "—"
													end)

													local Frame2 = fn56("Frame", {
														AnchorPoint = Vector2.new(0.5, 1),
														Position = UDim2.new(0.5, 0, 1, 0),
														Size = UDim2.new(1, -v82[118], v82[63], 1),
														BackgroundColor3 = theme.Data.Accent,
														BackgroundTransparency = 0.64,
														BorderSizePixel = v82[63],
														ZIndex = 6,
														Parent = arg.titleBar,
													})

													theme:BindAccent(Frame2, v82[178])
													local v98 = fn56
													local tbl29 = {}
													local numberSequence = NumberSequence.new
													local tbl30 = {}
													local v99 = NumberSequenceKeypoint.new(0, 1)
													local v100 = NumberSequenceKeypoint.new(0.5, v82[63])
													local new = NumberSequenceKeypoint.new
													tbl30[1] = v99
													tbl30[2] = v100

													do
														local values = table.pack(new(1, 1))
														table.move(values, 1, values.n, 3, tbl30)
													end

													tbl29.Transparency = numberSequence(tbl30)
													tbl29.Parent = Frame2
													v98("UIGradient", tbl29)

													arg.content = fn56("Frame", {
														Name = v82[144],
														Position = UDim2.fromOffset(20, 110),
														Size = UDim2.new(v82[103], -40, 1, -v82[133]),
														BackgroundTransparency = v82[103],
														ZIndex = v82[70],
														Parent = arg.main,
													})

													arg.headerCard = fn56("Frame", {
														Name = "PageHeader",
														Size = UDim2.new(v82[103], 0, 0, v82[38]),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.5,
														BorderSizePixel = 0,
														ZIndex = 5,
														Parent = arg.content,
													})

													fn57(v82[112], arg.headerCard)
													tbl26.apply(arg.headerCard, { transparency = v82[6] })
													theme:Bind(arg.headerCard, v82[178], v82[48])

													arg.headerTitle = fn56("TextLabel", {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(14, 6),
														Size = UDim2.new(1, -28, 0, v82[62]),
														Font = Enum.Font.MontserratBold,
														Text = "",
														TextSize = v82[137],
														TextColor3 = Color3.fromRGB(255, 255, 255),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 6,
														Parent = arg.headerCard,
													})

													theme:Bind(arg.headerTitle, "TextColor3", "Text")

													arg.headerSub = fn56(v82[61], {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(v82[160], 28),
														Size = UDim2.new(1, -28, v82[63], v82[137]),
														Font = Enum.Font.MontserratBold,
														Text = "",
														TextSize = v82[166],
														TextColor3 = Color3.fromRGB(200, 165, v82[145]),
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = v82[41],
														Parent = arg.headerCard,
													})

													theme:Bind(arg.headerSub, "TextColor3", v82[77])

													arg.headerDivider = fn56(v82[95], {
														AnchorPoint = Vector2.new(0.5, v82[103]),
														Position = UDim2.new(0.5, 0, 1, v82[63]),
														Size = UDim2.new(1, -v82[15], 0, 1),
														BackgroundColor3 = theme.Data.Accent,
														BackgroundTransparency = 0.72,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.headerCard,
													})

													theme:BindAccent(arg.headerDivider, "BackgroundColor3")

													arg.pageHost = fn56("Frame", {
														Name = v82[189],
														Position = UDim2.fromOffset(0, 62),
														Size = UDim2.new(1, 0, 1, -62),
														BackgroundTransparency = 1,
														ClipsDescendants = true,
														ZIndex = 5,
														Parent = arg.content,
													})

													arg.resizeHandle = fn56("TextButton", {
														AnchorPoint = Vector2.new(v82[103], v82[103]),
														Position = UDim2.new(1, -v82[70], 1, -v82[70]),
														Size = UDim2.fromOffset(22, 22),
														BackgroundTransparency = 1,
														AutoButtonColor = v82[139],
														Text = "",
														ZIndex = 9,
														Parent = arg.main,
													})

													for _, v101 in ipairs({ { v82[92], v82[160] }, { 0.82, v82[73] } }) do
														theme:Bind(fn56("Frame", {
															BackgroundColor3 = theme.Data.Sub,
															BackgroundTransparency = 0.35,
															BorderSizePixel = 0,
															AnchorPoint = Vector2.new(0.5, v82[6]),
															Position = UDim2.fromScale(v101[1], v101[1]),
															Size = UDim2.fromOffset(v101[2], v82[122]),
															Rotation = -45,
															ZIndex = 9,
															Parent = arg.resizeHandle,
														}, { fn56("UICorner", { CornerRadius = UDim.new(1, 0) }) }), "BackgroundColor3", "Sub")
													end
												end

												index.Tab = function(arg, arg2, arg3)
													local theme = arg.theme
													local n35 = #arg.tabs + 1

													local CanvasGroup = fn56("CanvasGroup", {
														BackgroundTransparency = v82[103],
														Size = UDim2.fromScale(1, 1),
														GroupTransparency = 0,
														Visible = false,
														ZIndex = 5,
														Parent = arg.pageHost,
													})

													local v96 = fn56(v82[54], {
														BackgroundTransparency = 1,
														Size = UDim2.fromScale(1, 1),
														ScrollBarThickness = v82[171],
														ScrollBarImageColor3 = theme.Data.Accent,
														ScrollBarImageTransparency = 0.4,
														CanvasSize = UDim2.new(),
														AutomaticCanvasSize = Enum.AutomaticSize.None,
														ZIndex = 5,
														Parent = CanvasGroup,
													})

													theme:BindAccent(v96, "ScrollBarImageColor3")
													fn56(v82[64], { Padding = UDim.new(v82[63], 10), SortOrder = Enum.SortOrder.LayoutOrder, Parent = v96 })

													fn56("UIPadding", {
														PaddingTop = UDim.new(0, 2),
														PaddingBottom = UDim.new(0, 12),
														PaddingRight = UDim.new(v82[63], 6),
														Parent = v96,
													})

													local tbl29 = { name = arg2, desc = arg3 or "", group = CanvasGroup, page = v96, index = n35, navBtn = nil }
													arg.tabs[n35] = tbl29
													local v97 = v96
													local n36 = 0

													local function fn61()
														return v97 or v96
													end

													local api

													api = {
														Button = function(arg4, arg5, arg6)
															return tbl12.Button(theme, fn61(), arg5, arg6)
														end,
														Toggle = function(arg4, arg5, arg6, arg7)
															return tbl12.Toggle(theme, fn61(), arg5, arg6, arg7)
														end,
														Slider = function(arg4, arg5, arg6, arg7, arg8, arg9, arg10)
															return tbl12.Slider(theme, fn61(), arg5, arg6, arg7, arg8, arg9, arg10)
														end,
														Dropdown = function(arg4, arg5, arg6, arg7, arg8)
															if not (3869 >= n24) then
																return tbl12.Dropdown(theme, fn61(), arg5, arg6, arg7, arg8)
															end

															while true do
															end
														end,
														Input = function(arg4, arg5, arg6, arg7)
															return tbl12.Input(theme, fn61(), arg5, arg6, arg7)
														end,
														Keybind = function(arg4, arg5, arg6, arg7)
															return tbl12.Keybind(theme, fn61(), arg5, arg6, arg7)
														end,
														Stepper = function(arg4, arg5, arg6, arg7, arg8, arg9, arg10)
															return tbl12.Stepper(theme, fn61(), arg5, arg6, arg7, arg8, arg9, arg10)
														end,
														Section = function(arg4, arg5)
															n36 += 1

															local v98 = fn56(v82[95], {
																Name = v82[89],
																Size = UDim2.new(1, 0, 0, v82[63]),
																AutomaticSize = Enum.AutomaticSize.Y,
																BackgroundColor3 = theme.Data.Panel,
																BackgroundTransparency = 1,
																BorderSizePixel = 0,
																LayoutOrder = n36,
																ClipsDescendants = v82[173],
																Parent = v96,
															})

															fn57(14, v98)
															theme:Bind(v98, v82[178], "Panel")
															theme:BindAccent(fn56("UIStroke", { Thickness = 1, Color = theme.Data.Accent, Transparency = 1, Parent = v98 }), "Color")

															fn56("UIListLayout", {
																Padding = UDim.new(0, v82[63]),
																HorizontalAlignment = Enum.HorizontalAlignment.Center,
																SortOrder = Enum.SortOrder.LayoutOrder,
																Parent = v98,
															})

															local Frame = fn56("Frame", {
																Name = "SectionHeader",
																Size = UDim2.new(1, v82[63], 0, 38),
																BackgroundTransparency = 1,
																BorderSizePixel = 0,
																LayoutOrder = v82[103],
																Parent = v98,
															})

															local v99 = fn56(v82[95], {
																AnchorPoint = Vector2.new(0, v82[6]),
																Position = UDim2.new(v82[63], 14, 0.5, 0),
																Size = UDim2.fromOffset(v82[53], v82[79]),
																BackgroundColor3 = theme.Data.Accent,
																BorderSizePixel = 0,
																ZIndex = 2,
																Parent = Frame,
															})

															fn57(2, v99)
															theme:BindAccent(v99, "BackgroundColor3")

															theme:Bind(fn56("TextLabel", {
																BackgroundTransparency = 1,
																Position = UDim2.fromOffset(v82[118], 0),
																Size = UDim2.new(1, -46, v82[103], 0),
																Font = Enum.Font.MontserratBold,
																Text = arg5,
																TextSize = 13,
																TextColor3 = Color3.fromRGB(255, 255, v82[14]),
																TextXAlignment = Enum.TextXAlignment.Left,
																TextYAlignment = Enum.TextYAlignment.Center,
																TextTruncate = Enum.TextTruncate.AtEnd,
																ZIndex = 2,
																Parent = Frame,
															}), v82[197], v82[157])

															local v100 = v82[178]

															theme:BindAccent(fn56("Frame", {
																AnchorPoint = Vector2.new(v82[6], v82[103]),
																Position = UDim2.new(v82[6], 0, v82[103], v82[63]),
																Size = UDim2.new(1, -v82[81], 0, v82[122]),
																BackgroundColor3 = theme.Data.Accent,
																BackgroundTransparency = 0.25,
																BorderSizePixel = 0,
																ZIndex = 2,
																Parent = Frame,
															}), v100)

															local Frame2 = fn56("Frame", {
																Name = "SectionBody",
																Size = UDim2.new(1, -12, v82[63], v82[63]),
																AutomaticSize = Enum.AutomaticSize.Y,
																BackgroundTransparency = 1,
																BorderSizePixel = v82[63],
																LayoutOrder = 2,
																Parent = v98,
															})

															fn56("UIListLayout", { Padding = UDim.new(v82[63], v82[70]), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame2 })
															fn56("UIPadding", { PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8), Parent = Frame2 })
															v97 = Frame2
															return v98
														end,
														Note = function(arg4, arg5)
															local v98 = fn56(v82[95], {
																Size = UDim2.new(1, v82[63], 0, 38),
																BackgroundColor3 = theme.Data.Accent,
																BackgroundTransparency = 0.9,
																BorderSizePixel = 0,
																Parent = fn61(),
															})

															fn57(10, v98)
															theme:BindAccent(v98, "BackgroundColor3")

															theme:Bind(fn56(v82[61], {
																BackgroundTransparency = v82[103],
																Position = UDim2.fromOffset(12, 0),
																Size = UDim2.new(v82[103], -24, 1, 0),
																Font = Enum.Font.Montserrat,
																Text = arg5,
																TextSize = 10,
																TextColor3 = theme.Data.Sub,
																TextWrapped = true,
																TextXAlignment = Enum.TextXAlignment.Left,
																TextYAlignment = Enum.TextYAlignment.Center,
																ZIndex = 2,
																Parent = v98,
															}), "TextColor3", v82[77])

															return v98
														end,
														Label = function(arg4, arg5)
															return api:Section(arg5)
														end,
													}

													tbl29.api = api

													if n35 == 1 then
														arg:SelectTab(1)

														if n24 <= 3851 then
															while true do
															end
														end
													end

													return api
												end

												index.FinalizeBuild = function(arg)
													if arg._finalized then
														return
													end
													arg._finalized = true
													arg:_rebuildNav()

													for _, tab in ipairs(arg.tabs) do
														tab.page.AutomaticCanvasSize = Enum.AutomaticSize.Y
													end

													arg.gui.Parent = arg._playerGui
													arg:_playOpen()
												end

												index.SelectTab = function(arg, arg2)
													local v96 = arg.tabs[arg2]
													if not v96 or arg.activeTab == v96 then
														return
													end

													if arg.activeTab then
														local group = arg.activeTab.group
														tbl11.to(group, tbl11.Presets.Snappy, { GroupTransparency = 1, Position = UDim2.fromOffset(-24, 0) })

														task.delay(0.16, function()
															if arg.activeTab and arg.activeTab.group ~= group then
																group.Visible = false
															end
														end)
													end

													arg.activeTab = v96
													arg.headerTitle.Text = v96.name
													arg.headerSub.Text = v96.desc
													arg:_highlightNav()
													v96.group.Visible = v82[173]
													v96.group.GroupTransparency = 1
													v96.group.Position = UDim2.fromOffset(24, v82[63])
													tbl11.to(v96.group, tbl11.Presets.Smooth, { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) })
												end

												index._applyLayout = function(arg)
													local layout = arg.layout
													local visible = v82[173]

													if layout == 2 then
														arg.content.Position = UDim2.fromOffset(v82[162], 64)
														arg.content.Size = UDim2.new(1, -200, v82[103], -76)
													elseif layout == 3 then
														arg.content.Position = UDim2.fromOffset(20, 118)
														arg.content.Size = UDim2.new(1, -v82[33], 1, -130)
														visible = false
													elseif layout == v82[53] then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(1, -v82[33], 1, -118)
													elseif layout == v82[70] then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(1, -200, 1, -76)
													elseif layout == v82[41] then
														arg.content.Position = UDim2.fromOffset(20, 110)
														arg.content.Size = UDim2.new(1, -40, 1, -122)
													elseif layout == 7 then
														arg.content.Position = UDim2.fromOffset(82, v82[88])
														arg.content.Size = UDim2.new(1, -98, 1, -76)
													elseif layout == 8 then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(v82[103], -v82[125], 1, -76)
													elseif layout == 9 then
														arg.content.Position = UDim2.fromOffset(v82[79], v82[180])
														arg.content.Size = UDim2.new(1, -v82[33], v82[103], -122)
													elseif layout == 10 then
														arg.content.Position = UDim2.fromOffset(82, v82[88])
														arg.content.Size = UDim2.new(1, -v82[125], 1, -76)
													elseif layout == 11 then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(1, -v82[33], v82[103], -122)
														visible = v82[139]
													elseif layout == v82[172] then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(v82[103], -40, 1, -118)
													elseif layout == 13 then
														arg.content.Position = UDim2.fromOffset(20, 64)
														arg.content.Size = UDim2.new(v82[103], -40, 1, -v82[40])
														visible = v82[139]
													elseif layout == v82[160] then
														arg.content.Position = UDim2.fromOffset(v82[79], 64)
														arg.content.Size = UDim2.new(1, -v82[33], 1, -126)
													elseif layout == 15 then
														arg.content.Position = UDim2.fromOffset(20, v82[180])
														arg.content.Size = UDim2.new(v82[103], -40, 1, -122)
													elseif layout == 16 then
														arg.content.Position = UDim2.fromOffset(52, 64)
														arg.content.Size = UDim2.new(1, -72, v82[103], -v82[124])
													else
														arg.content.Position = UDim2.fromOffset(20, 110)
														arg.content.Size = UDim2.new(v82[103], -40, 1, -122)
													end

													arg.headerTitle.Visible = visible
													arg.headerSub.Visible = visible
													arg.headerDivider.Visible = visible

													if arg.headerCard then
														arg.headerCard.Visible = visible
													end

													if visible then
														arg.pageHost.Position = UDim2.fromOffset(0, 62)
														arg.pageHost.Size = UDim2.new(v82[103], 0, 1, -62)
													else
														arg.pageHost.Position = UDim2.fromOffset(0, 0)
														arg.pageHost.Size = UDim2.new(1, 0, 1, 0)
													end
												end

												index._buildPillNav = function(arg, arg2)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														Position = arg2 and UDim2.new(v82[63], 16, 1, -52) or UDim2.fromOffset(16, v82[88]),
														Size = UDim2.new(1, -v82[118], v82[63], 42),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.55,
														BorderSizePixel = v82[63],
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(12, Frame)
													tbl26.apply(Frame, { transparency = 0.55 })
													theme:Bind(Frame, "BackgroundColor3", "Panel")
													theme:BindAccent(fn56(v82[114], { Thickness = v82[103], Color = theme.Data.Accent, Transparency = 0.8, Parent = Frame }), "Color")

													fn56("UIPadding", {
														PaddingTop = UDim.new(0, 4),
														PaddingBottom = UDim.new(0, 4),
														PaddingLeft = UDim.new(0, 4),
														PaddingRight = UDim.new(v82[63], 4),
														Parent = Frame,
													})

													fn56("UIListLayout", {
														FillDirection = Enum.FillDirection.Horizontal,
														Padding = UDim.new(0, 4),
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														VerticalAlignment = Enum.VerticalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = Frame,
													})

													arg._nav = Frame
													local n35 = math.max(1, #arg.tabs)
													local n36 = (-8 - 4 * (n35 - 1)) / n35

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.new(1 / n35, n36, 1, -8),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = 1,
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name,
															TextSize = 11,
															TextColor3 = theme.Data.Sub,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = 7,
															ClipsDescendants = true,
															Parent = Frame,
														})

														fn57(8, TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")

														local Frame2 = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, 1),
															Position = UDim2.new(0.5, v82[63], 1, -1),
															Size = UDim2.new(0, 0, 0, 2.5),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = 0,
															ZIndex = 8,
															Parent = TextButton,
														})

														fn57(v82[122], Frame2)
														theme:BindAccent(Frame2, v82[178])
														tab.navIndicator = Frame2
														local v96 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[151], TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 1, TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v96.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildRailNav = function(arg, arg2)
													local theme = arg.theme

													local v96 = fn56(v82[95], {
														Name = "Nav",
														Position = arg2 == "right" and UDim2.new(1, -172, v82[63], 64) or UDim2.fromOffset(v82[172], 64),
														Size = UDim2.new(0, 160, 1, -76),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.58,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(14, v96)
													tbl26.apply(v96, { transparency = v82[99], reflection = false })
													theme:Bind(v96, v82[178], "Panel")
													v96.ClipsDescendants = true

													local Frame = fn56("Frame", {
														Name = "TabButtons",
														BackgroundTransparency = 1,
														Position = UDim2.new(0, 0, 0, v82[106]),
														Size = UDim2.new(1, v82[63], 0, 0),
														AutomaticSize = Enum.AutomaticSize.Y,
														ZIndex = 7,
														Parent = v96,
													})

													fn56("UIListLayout", {
														Padding = UDim.new(0, v82[62]),
														SortOrder = Enum.SortOrder.LayoutOrder,
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														Parent = Frame,
													})

													local TextLabel = fn56("TextLabel", {
														Name = "RailFoot",
														AnchorPoint = Vector2.new(0.5, 1),
														Position = UDim2.new(0.5, 0, v82[103], -8),
														Size = UDim2.new(v82[103], -16, 0, 18),
														BackgroundTransparency = 1,
														Font = Enum.Font.MontserratBlack,
														Text = "HOOK DUELS",
														TextSize = 12,
														TextColor3 = Color3.fromRGB(v82[14], 255, 255),
														ZIndex = v82[24],
														Parent = v96,
													})

													local Frame2 = fn56("Frame", {
														AnchorPoint = Vector2.new(0.5, v82[63]),
														Position = UDim2.new(v82[6], 0, v82[103], v82[103]),
														Size = UDim2.new(0, 64, 0, 2),
														BackgroundColor3 = theme.Data.Accent,
														BorderSizePixel = v82[63],
														ZIndex = 7,
														Parent = TextLabel,
													})

													fn57(1, Frame2)
													theme:BindAccent(Frame2, v82[178])
													arg._nav = v96

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.fromOffset(v82[109], 48),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = v82[103],
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name,
															TextSize = 13,
															TextColor3 = theme.Data.Sub,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = 7,
															Parent = Frame,
														})

														fn57(14, TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")
														tab.navIndicator = nil
														local v97 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v97 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.9, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v97 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[103], TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v97.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildArrowNav = function(arg)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														Position = UDim2.fromOffset(16, 64),
														Size = UDim2.new(1, -v82[118], 0, 48),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = v82[141],
														BorderSizePixel = v82[63],
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(12, Frame)
													tbl26.apply(Frame, { transparency = v82[141] })
													theme:Bind(Frame, v82[178], "Panel")
													arg._nav = Frame

													local function fn61(arg2)
														local TextButton = fn56("TextButton", {
															AnchorPoint = Vector2.new(arg2 < 0 and v82[63] or v82[103], v82[6]),
															Position = UDim2.new(arg2 < v82[63] and 0 or v82[103], arg2 < v82[63] and 8 or -8, 0.5, v82[63]),
															Size = UDim2.fromOffset(34, 34),
															BackgroundColor3 = theme.Data.Bg,
															BackgroundTransparency = 0.3,
															AutoButtonColor = false,
															Text = "",
															ZIndex = 7,
															Parent = Frame,
														})

														fn57(9, TextButton)
														theme:Bind(TextButton, v82[178], "Bg")
														local v96 = v82[35]
														theme:BindAccent(fn56("UIStroke", { Thickness = 1, Color = theme.Data.Accent, Transparency = 0.82, Parent = TextButton }), v96)
														local v97 = fn58(TextButton, theme.Data.Accent, 12)
														v97.AnchorPoint = Vector2.new(0.5, v82[6])
														v97.Position = UDim2.fromScale(v82[6], 0.5)
														v97.Rotation = arg2 < 0 and v82[110] or -90
														v97.ZIndex = 8

														for _, child in ipairs(v97:GetChildren()) do
															if child:IsA("Frame") then
																theme:BindAccent(child, "BackgroundColor3")
															end
														end

														TextButton.MouseEnter:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0 })
														end)

														TextButton.MouseLeave:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.3 })
														end)

														TextButton.MouseButton1Down:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(30, 30) })
														end)

														TextButton.MouseButton1Up:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Spring, { Size = UDim2.fromOffset(34, 34) })
														end)

														TextButton.MouseButton1Click:Connect(function()
															local n35 = #arg.tabs
															if n35 == 0 then
																return
															end
															arg:SelectTab(((arg.activeTab and arg.activeTab.index or v82[103]) - 1 + arg2) % n35 + 1)
														end)

														return TextButton
													end

													fn61(-1)
													fn61(1)

													arg._arrowLabel = fn56("TextLabel", {
														AnchorPoint = Vector2.new(0.5, 0.5),
														Position = UDim2.new(0.5, 0, 0.5, -5),
														Size = UDim2.new(1, -104, 0, 20),
														BackgroundTransparency = 1,
														Font = Enum.Font.MontserratBold,
														Text = "",
														TextSize = v82[3],
														TextColor3 = theme.Data.Text,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = v82[24],
														Parent = Frame,
													})

													theme:Bind(arg._arrowLabel, "TextColor3", "Text")

													arg._arrowCounter = fn56("TextLabel", {
														AnchorPoint = Vector2.new(v82[6], 0.5),
														Position = UDim2.new(0.5, 0, 0.5, v82[166]),
														Size = UDim2.new(1, -104, 0, 12),
														BackgroundTransparency = 1,
														Font = Enum.Font.MontserratBold,
														Text = "",
														TextSize = 9,
														TextColor3 = theme.Data.Accent,
														ZIndex = 7,
														Parent = Frame,
													})

													theme:BindAccent(arg._arrowCounter, "TextColor3")
												end

												index._buildDropdownNav = function(arg, arg2)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														Position = arg2 and UDim2.new(v82[63], 16, 1, -52) or UDim2.fromOffset(v82[137], v82[88]),
														Size = UDim2.new(1, -32, 0, 42),
														BackgroundTransparency = 1,
														ZIndex = 8,
														Parent = arg.main,
													})

													arg._nav = Frame

													local v96 = fn56(v82[104], {
														Size = UDim2.new(1, 0, v82[63], v82[96]),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.54,
														AutoButtonColor = false,
														Text = "",
														ZIndex = 9,
														Parent = Frame,
													})

													fn57(12, v96)
													tbl26.apply(v96, { transparency = 0.54 })
													theme:Bind(v96, "BackgroundColor3", "Panel")

													local Frame2 = fn56("Frame", {
														AnchorPoint = Vector2.new(0, 0.5),
														Position = UDim2.new(0, 10, v82[6], 0),
														Size = UDim2.fromOffset(3, 18),
														BackgroundColor3 = theme.Data.Accent,
														BorderSizePixel = v82[63],
														ZIndex = 10,
														Parent = v96,
													})

													fn57(v82[122], Frame2)
													theme:BindAccent(Frame2, "BackgroundColor3")

													arg._dropHeadLabel = fn56("TextLabel", {
														BackgroundTransparency = 1,
														Position = UDim2.fromOffset(22, 0),
														Size = UDim2.new(1, -58, v82[103], 0),
														Font = Enum.Font.MontserratBold,
														Text = arg.activeTab and arg.activeTab.name or "",
														TextSize = v82[172],
														TextColor3 = theme.Data.Text,
														TextXAlignment = Enum.TextXAlignment.Left,
														TextTruncate = Enum.TextTruncate.AtEnd,
														ZIndex = 10,
														Parent = v96,
													})

													theme:Bind(arg._dropHeadLabel, "TextColor3", "Text")
													local v97 = fn58(v96, theme.Data.Accent, 12)
													v97.AnchorPoint = Vector2.new(1, 0.5)
													v97.Position = UDim2.new(1, -v82[160], 0.5, 0)
													v97.ZIndex = 10

													for _, child in ipairs(v97:GetChildren()) do
														if child:IsA("Frame") then
															theme:BindAccent(child, "BackgroundColor3")
														end
													end

													local Frame3 = fn56("Frame", {
														Size = UDim2.new(1, v82[63], 0, 0),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = v82[1],
														ClipsDescendants = v82[173],
														ZIndex = 9,
														Parent = Frame,
													})

													if arg2 then
														Frame3.AnchorPoint = Vector2.new(0, v82[103])
														Frame3.Position = UDim2.new(0, 0, v82[63], -5)
													else
														Frame3.Position = UDim2.fromOffset(0, v82[154])
													end

													fn57(12, Frame3)
													theme:Bind(Frame3, "BackgroundColor3", v82[48])
													theme:BindAccent(fn56("UIStroke", { Thickness = 1, Color = theme.Data.Accent, Transparency = 0.82, Parent = Frame3 }), "Color")
													fn56(v82[64], { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = Frame3 })

													fn56("UIPadding", {
														PaddingTop = UDim.new(0, 6),
														PaddingBottom = UDim.new(v82[63], 6),
														PaddingLeft = UDim.new(0, 6),
														PaddingRight = UDim.new(0, 6),
														Parent = Frame3,
													})

													local flag23 = false

													local function fn61(arg3)
														flag23 = arg3
														tbl11.to(Frame3, tbl11.Presets.Smooth, { Size = UDim2.new(1, 0, 0, arg3 and #arg.tabs * 36 + 12 or v82[63]) })
														tbl11.to(v97, tbl11.Presets.Smooth, { Rotation = arg3 and v82[194] or v82[63] })
													end

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.new(v82[103], v82[63], 0, 34),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = v82[103],
															AutoButtonColor = v82[139],
															Font = Enum.Font.MontserratBold,
															Text = "   " .. tab.name,
															TextSize = 11,
															TextColor3 = theme.Data.Sub,
															TextXAlignment = Enum.TextXAlignment.Left,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = v82[21],
															Parent = Frame3,
														})

														fn57(8, TextButton)
														theme:BindAccent(TextButton, v82[178])

														local v98 = fn56(v82[95], {
															AnchorPoint = Vector2.new(0, 0.5),
															Position = UDim2.new(v82[63], 8, 0.5, 0),
															Size = UDim2.fromOffset(0, v82[63]),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = 0,
															ZIndex = 11,
															Parent = TextButton,
														})

														fn57(4, v98)
														theme:BindAccent(v98, "BackgroundColor3")
														tab.navIndicator = v98
														local v99 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v99 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[45], TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v99 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 1, TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v99.index)
															fn61(false)
														end)

														tab.navBtn = TextButton
													end

													v96.MouseEnter:Connect(function()
														tbl11.to(v96, tbl11.Presets.Snappy, { BackgroundTransparency = 0.46 })
													end)

													v96.MouseLeave:Connect(function()
														tbl11.to(v96, tbl11.Presets.Snappy, { BackgroundTransparency = 0.54 })
													end)

													v96.MouseButton1Click:Connect(function()
														fn61(not flag23)
													end)
												end

												index._buildChipRail = function(arg, arg2)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														Position = arg2 == "right" and UDim2.new(1, -v82[132], 0, 64) or UDim2.fromOffset(14, 64),
														Size = UDim2.new(0, 58, 1, -76),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = v82[99],
														BorderSizePixel = v82[63],
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(v82[3], Frame)
													tbl26.apply(Frame, { transparency = 0.58, reflection = false })
													theme:Bind(Frame, v82[178], v82[48])

													local ScrollingFrame = fn56("ScrollingFrame", {
														BackgroundTransparency = 1,
														Size = UDim2.fromScale(v82[103], 1),
														ScrollBarThickness = 0,
														CanvasSize = UDim2.new(),
														AutomaticCanvasSize = Enum.AutomaticSize.Y,
														ZIndex = 7,
														Parent = Frame,
													})

													fn56(v82[64], {
														Padding = UDim.new(v82[63], 8),
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = ScrollingFrame,
													})

													fn56("UIPadding", { PaddingTop = UDim.new(v82[63], v82[21]), PaddingBottom = UDim.new(0, 10), Parent = ScrollingFrame })
													arg._nav = Frame

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.fromOffset(38, 38),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = v82[71],
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name:sub(v82[103], v82[103]):upper(),
															TextSize = 14,
															TextColor3 = theme.Data.Sub,
															ZIndex = v82[24],
															Parent = ScrollingFrame,
														})

														fn57(v82[166], TextButton)
														theme:BindAccent(TextButton, v82[178])
														theme:BindAccent(fn56(v82[114], { Thickness = 1, Color = theme.Data.Accent, Transparency = v82[119], Parent = TextButton }), "Color")

														local Frame2 = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, v82[103]),
															Position = UDim2.new(0.5, 0, v82[103], -v82[171]),
															Size = UDim2.fromOffset(0, v82[63]),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = 0,
															ZIndex = 8,
															Parent = TextButton,
														})

														fn57(3, Frame2)
														theme:BindAccent(Frame2, v82[178])
														tab.navIndicator = Frame2
														local v96 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.6, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.78, TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v96.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildSegmentedNav = function(arg, arg2)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														AnchorPoint = Vector2.new(0.5, arg2 and 1 or v82[63]),
														Position = arg2 and UDim2.new(0.5, v82[63], 1, -10) or UDim2.new(0.5, v82[63], 0, v82[88]),
														Size = UDim2.new(v82[103], arg2 and -64 or -32, 0, 42),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.58,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(12, Frame)
													tbl26.apply(Frame, { transparency = 0.58 })
													theme:Bind(Frame, "BackgroundColor3", "Panel")

													fn56("UIListLayout", {
														FillDirection = Enum.FillDirection.Horizontal,
														Padding = UDim.new(v82[63], 1),
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														VerticalAlignment = Enum.VerticalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = Frame,
													})

													fn56("UIPadding", {
														PaddingLeft = UDim.new(0, 4),
														PaddingRight = UDim.new(0, 4),
														PaddingTop = UDim.new(0, 4),
														PaddingBottom = UDim.new(0, 4),
														Parent = Frame,
													})

													arg._nav = Frame
													local n35 = math.max(1, #arg.tabs)
													local n36 = (-8 - n35 - v82[103]) / n35

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.new(1 / n35, n36, v82[103], -8),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = 1,
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name,
															TextSize = v82[172],
															TextColor3 = Color3.fromRGB(v82[74], v82[142], 220),
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = v82[24],
															Parent = Frame,
														})

														fn57(v82[73], TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")

														local Frame2 = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, 1),
															Position = UDim2.new(0.5, 0, v82[103], -2),
															Size = UDim2.new(0, v82[63], 0, 2),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = v82[63],
															ZIndex = 8,
															Parent = TextButton,
														})

														fn57(1, Frame2)
														theme:BindAccent(Frame2, "BackgroundColor3")
														tab.navIndicator = Frame2
														local v96 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.92, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 1, TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v96.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildVArrowNav = function(arg)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														Position = UDim2.fromOffset(14, 64),
														Size = UDim2.new(v82[63], 58, 1, -76),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.58,
														BorderSizePixel = 0,
														ZIndex = v82[41],
														Parent = arg.main,
													})

													fn57(15, Frame)
													tbl26.apply(Frame, { transparency = 0.58, reflection = false })
													theme:Bind(Frame, "BackgroundColor3", "Panel")
													arg._nav = Frame

													local function fn61(arg2)
														local TextButton = fn56("TextButton", {
															AnchorPoint = Vector2.new(0.5, arg2 < 0 and 0 or 1),
															Position = UDim2.new(0.5, 0, arg2 < 0 and 0 or 1, arg2 < 0 and 10 or -10),
															Size = UDim2.fromOffset(v82[121], 36),
															BackgroundColor3 = theme.Data.Bg,
															BackgroundTransparency = 0.34,
															AutoButtonColor = v82[139],
															Text = "",
															ZIndex = 7,
															Parent = Frame,
														})

														fn57(10, TextButton)
														theme:Bind(TextButton, "BackgroundColor3", "Bg")
														theme:BindAccent(fn56("UIStroke", { Thickness = 1, Color = theme.Data.Accent, Transparency = 0.82, Parent = TextButton }), "Color")
														local v96 = fn58(TextButton, theme.Data.Accent, v82[172])
														v96.AnchorPoint = Vector2.new(0.5, v82[6])
														v96.Position = UDim2.fromScale(0.5, v82[6])
														v96.Rotation = arg2 < v82[63] and 180 or 0
														v96.ZIndex = 8

														for _, child in ipairs(v96:GetChildren()) do
															if child:IsA("Frame") then
																theme:BindAccent(child, "BackgroundColor3")
															end
														end

														TextButton.MouseEnter:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0 })
														end)

														TextButton.MouseLeave:Connect(function()
															tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.34 })
														end)

														TextButton.MouseButton1Click:Connect(function()
															local n35 = #arg.tabs
															if n35 == v82[63] then
																return
															end
															arg:SelectTab(((arg.activeTab and arg.activeTab.index or 1) - 1 + arg2) % n35 + v82[103])
														end)

														return TextButton
													end

													fn61(-v82[103])
													fn61(1)

													arg._vArrowCounter = fn56("TextLabel", {
														AnchorPoint = Vector2.new(0.5, 0.5),
														Position = UDim2.fromScale(0.5, 0.5),
														Size = UDim2.fromOffset(36, 48),
														BackgroundColor3 = theme.Data.Accent,
														BackgroundTransparency = v82[152],
														Font = Enum.Font.MontserratBold,
														Text = "",
														TextSize = 11,
														TextColor3 = theme.Data.Text,
														TextWrapped = true,
														ZIndex = v82[24],
														Parent = Frame,
													})

													fn57(10, arg._vArrowCounter)
													theme:BindAccent(arg._vArrowCounter, "BackgroundColor3")
													theme:Bind(arg._vArrowCounter, v82[197], "Text")
												end

												index._buildBottomBarNav = function(arg)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														AnchorPoint = Vector2.new(0.5, 1),
														Position = UDim2.new(0.5, v82[63], v82[103], -v82[21]),
														Size = UDim2.new(v82[103], -24, v82[63], 46),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.54,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(12, Frame)
													tbl26.apply(Frame, { transparency = v82[191] })
													theme:Bind(Frame, v82[178], "Panel")

													fn56("UIListLayout", {
														FillDirection = Enum.FillDirection.Horizontal,
														Padding = UDim.new(0, 3),
														VerticalAlignment = Enum.VerticalAlignment.Center,
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = Frame,
													})

													fn56("UIPadding", {
														PaddingLeft = UDim.new(v82[63], v82[53]),
														PaddingRight = UDim.new(0, v82[53]),
														PaddingTop = UDim.new(0, v82[53]),
														PaddingBottom = UDim.new(0, 4),
														Parent = Frame,
													})

													arg._nav = Frame
													local n35 = math.max(1, #arg.tabs)
													local n36 = (-8 - v82[171] * (n35 - v82[103])) / n35

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.new(v82[103] / n35, n36, 1, -8),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = v82[103],
															AutoButtonColor = v82[139],
															Font = Enum.Font.MontserratBold,
															Text = tab.name,
															TextSize = 11,
															TextColor3 = theme.Data.Sub,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = 7,
															Parent = Frame,
														})

														fn57(8, TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")

														local Frame2 = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, 0),
															Position = UDim2.new(0.5, 0, v82[63], 2),
															Size = UDim2.new(0, 0, v82[63], v82[122]),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = v82[63],
															ZIndex = v82[73],
															Parent = TextButton,
														})

														fn57(1, Frame2)
														theme:BindAccent(Frame2, v82[178])
														tab.navIndicator = Frame2
														local v96 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.9, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 1, TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v96.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildChipDock = function(arg)
													local theme = arg.theme

													local Frame = fn56("Frame", {
														Name = "Nav",
														AnchorPoint = Vector2.new(0.5, v82[103]),
														Position = UDim2.new(0.5, v82[63], 1, -v82[21]),
														AutomaticSize = Enum.AutomaticSize.X,
														Size = UDim2.new(0, 0, 0, 50),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.56,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(14, Frame)
													tbl26.apply(Frame, { transparency = 0.56 })
													theme:Bind(Frame, "BackgroundColor3", "Panel")

													fn56("UIListLayout", {
														FillDirection = Enum.FillDirection.Horizontal,
														Padding = UDim.new(v82[63], 6),
														VerticalAlignment = Enum.VerticalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = Frame,
													})

													fn56("UIPadding", {
														PaddingLeft = UDim.new(v82[63], 7),
														PaddingRight = UDim.new(0, 7),
														PaddingTop = UDim.new(0, 6),
														PaddingBottom = UDim.new(0, v82[41]),
														Parent = Frame,
													})

													arg._nav = Frame

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.fromOffset(38, 38),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = 0.78,
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name:sub(1, 1):upper(),
															TextSize = 14,
															TextColor3 = theme.Data.Sub,
															ZIndex = 7,
															Parent = Frame,
														})

														fn57(11, TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")
														theme:BindAccent(fn56("UIStroke", { Thickness = 1, Color = theme.Data.Accent, Transparency = 0.84, Parent = TextButton }), "Color")

														local Frame2 = fn56("Frame", {
															AnchorPoint = Vector2.new(0.5, v82[103]),
															Position = UDim2.new(0.5, 0, 1, -v82[171]),
															Size = UDim2.fromOffset(v82[63], 0),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = 0,
															ZIndex = v82[73],
															Parent = TextButton,
														})

														fn57(3, Frame2)
														theme:BindAccent(Frame2, "BackgroundColor3")
														tab.navIndicator = Frame2
														local v96 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.6, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v96 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[71], TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v96.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._buildUnderlineNav = function(arg)
													local theme = arg.theme

													local v96 = fn56(v82[95], {
														Name = "Nav",
														Position = UDim2.fromOffset(16, 64),
														Size = UDim2.new(1, -32, 0, 42),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.58,
														BorderSizePixel = 0,
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(12, v96)
													tbl26.apply(v96, { transparency = 0.58 })
													theme:Bind(v96, "BackgroundColor3", "Panel")

													theme:BindAccent(fn56("Frame", {
														AnchorPoint = Vector2.new(0.5, v82[103]),
														Position = UDim2.new(0.5, 0, 1, -v82[53]),
														Size = UDim2.new(1, -18, 0, 1),
														BackgroundColor3 = theme.Data.Accent,
														BackgroundTransparency = 0.9,
														BorderSizePixel = 0,
														ZIndex = 7,
														Parent = v96,
													}), "BackgroundColor3")

													local Frame = fn56("Frame", { BackgroundTransparency = v82[103], Size = UDim2.fromScale(1, 1), ZIndex = 7, Parent = v96 })

													fn56("UIListLayout", {
														FillDirection = Enum.FillDirection.Horizontal,
														Padding = UDim.new(0, 3),
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														VerticalAlignment = Enum.VerticalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = Frame,
													})

													fn56("UIPadding", {
														PaddingLeft = UDim.new(0, 4),
														PaddingRight = UDim.new(0, 4),
														PaddingTop = UDim.new(0, 4),
														PaddingBottom = UDim.new(0, 4),
														Parent = Frame,
													})

													arg._nav = v96
													local n35 = math.max(1, #arg.tabs)
													local n36 = (-8 - v82[171] * (n35 - v82[103])) / n35

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.new(1 / n35, n36, 1, -v82[73]),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = 1,
															AutoButtonColor = false,
															Font = Enum.Font.MontserratBold,
															Text = tab.name,
															TextSize = 11,
															TextColor3 = theme.Data.Sub,
															TextTruncate = Enum.TextTruncate.AtEnd,
															ZIndex = 8,
															Parent = Frame,
														})

														fn57(8, TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")

														local v97 = fn56(v82[95], {
															AnchorPoint = Vector2.new(v82[6], 1),
															Position = UDim2.new(0.5, 0, 1, -1),
															Size = UDim2.new(v82[63], 0, 0, 3),
															BackgroundColor3 = theme.Data.Accent,
															BorderSizePixel = v82[63],
															ZIndex = 9,
															Parent = TextButton,
														})

														fn57(v82[122], v97)
														theme:BindAccent(v97, v82[178])
														local v98 = fn56
														local v99 = v82[101]
														local tbl29 = {}
														local numberSequence = NumberSequence.new
														local tbl30 = {}
														local v100 = NumberSequenceKeypoint.new(0, v82[83])
														local v101 = NumberSequenceKeypoint.new(0.5, 0)
														tbl30[1] = v100
														tbl30[2] = v101

														do
															local values = table.pack(NumberSequenceKeypoint.new(1, 0.45))
															table.move(values, 1, values.n, 3, tbl30)
														end

														tbl29.Transparency = numberSequence(tbl30)
														tbl29.Parent = v97
														v98(v99, tbl29)
														tab.navBtn = TextButton
														tab.navUnderline = v97
														local v102 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v102 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = 0.9, TextColor3 = theme.Data.Text })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v102 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { BackgroundTransparency = v82[103], TextColor3 = theme.Data.Sub })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v102.index)
														end)
													end
												end

												index._buildDotsNav = function(arg)
													local theme = arg.theme

													local v96 = fn56(v82[95], {
														Name = v82[196],
														Position = UDim2.fromOffset(14, v82[88]),
														Size = UDim2.new(0, 28, 1, -v82[124]),
														BackgroundColor3 = theme.Data.Panel,
														BackgroundTransparency = 0.64,
														BorderSizePixel = v82[63],
														ZIndex = 6,
														Parent = arg.main,
													})

													fn57(14, v96)
													tbl26.apply(v96, { transparency = 0.64 })
													theme:Bind(v96, "BackgroundColor3", "Panel")

													fn56("UIListLayout", {
														Padding = UDim.new(v82[63], v82[146]),
														HorizontalAlignment = Enum.HorizontalAlignment.Center,
														VerticalAlignment = Enum.VerticalAlignment.Center,
														SortOrder = Enum.SortOrder.LayoutOrder,
														Parent = v96,
													})

													arg._nav = v96

													for _, tab in ipairs(arg.tabs) do
														local TextButton = fn56("TextButton", {
															Size = UDim2.fromOffset(v82[73], v82[73]),
															BackgroundColor3 = theme.Data.Accent,
															BackgroundTransparency = 0.68,
															AutoButtonColor = v82[139],
															Text = "",
															ZIndex = 7,
															Parent = v96,
														})

														fn57(v82[53], TextButton)
														theme:BindAccent(TextButton, "BackgroundColor3")
														local v97 = tab

														TextButton.MouseEnter:Connect(function()
															if arg.activeTab ~= v97 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(10, v82[160]), BackgroundTransparency = 0.34 })
															end
														end)

														TextButton.MouseLeave:Connect(function()
															if arg.activeTab ~= v97 then
																tbl11.to(TextButton, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(v82[73], 8), BackgroundTransparency = v82[182] })
															end
														end)

														TextButton.MouseButton1Click:Connect(function()
															arg:SelectTab(v97.index)
														end)

														tab.navBtn = TextButton
													end
												end

												index._rebuildNav = function(arg)
													if arg._nav then
														arg._nav:Destroy()
														arg._nav = nil
													end

													for _, tab in ipairs(arg.tabs) do
														tab.navBtn = nil
														tab.navUnderline = nil
														tab.navIndicator = nil
													end

													local layout = arg.layout

													if layout == v82[122] then
														arg:_buildRailNav("left")
													elseif layout == 3 then
														arg:_buildArrowNav()
													elseif layout == v82[53] then
														arg:_buildPillNav(true)
													elseif layout == 5 then
														arg:_buildRailNav("right")
													elseif layout == 6 then
														arg:_buildDropdownNav()
													elseif layout == v82[24] then
														arg:_buildChipRail(v82[2])
													elseif layout == v82[73] then
														arg:_buildChipRail("right")
													elseif layout == 9 then
														arg:_buildSegmentedNav()
													elseif layout == 10 then
														arg:_buildVArrowNav()
													elseif layout == v82[166] then
														arg:_buildBottomBarNav()
													elseif layout == 12 then
														arg:_buildSegmentedNav(true)
													elseif layout == 13 then
														arg:_buildDropdownNav(true)
													elseif layout == 14 then
														arg:_buildChipDock()
													elseif layout == v82[3] then
														if n26(1804) > 5974 then
															arg:_buildUnderlineNav()
														else
															while true do
															end
														end
													elseif layout == v82[137] then
														arg:_buildDotsNav()
													else
														arg:_buildPillNav(false)
													end

													arg:_applyLayout()
													arg:_highlightNav()
												end

												index._highlightNav = function(arg)
													local theme = arg.theme
													local layout = arg.layout
													local flag23 = layout == 2 or layout == 5
													local flag24 = layout == 7 or layout == v82[73] or layout == v82[160]
													local flag25 = layout == 6 or layout == v82[112]
													local flag26 = layout == v82[103] or layout == 4 or layout == 9 or layout == 11 or layout == v82[172]

													for _, tab in ipairs(arg.tabs) do
														if tab.navBtn then
															local backgroundTransparency = tab == arg.activeTab

															if layout == 15 then
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and 0.84 or 1,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(255, 255, 255) or theme.Data.Sub,
																})

																if tab.navUnderline then
																	tbl11.to(tab.navUnderline, tbl11.Presets.Spring, {
																		Size = backgroundTransparency and UDim2.new(1, -18, v82[63], v82[171]) or UDim2.new(0, 0, 0, v82[171]),
																	})
																end
															elseif layout == 16 then
																tbl11.to(tab.navBtn, tbl11.Presets.Spring, { Size = backgroundTransparency and UDim2.fromOffset(v82[73], 26) or UDim2.fromOffset(8, 8) })
																local to = tbl11.to
																local navBtn = tab.navBtn
																local smooth = tbl11.Presets.Smooth
																local tbl29 = {}
																backgroundTransparency = backgroundTransparency and 0.08
																tbl29.BackgroundTransparency = backgroundTransparency or 0.68
																to(navBtn, smooth, tbl29)
															elseif flag23 then
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and 0.12 or 1,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(v82[14], 255, 255) or theme.Data.Sub,
																})

																if tab.navIndicator then
																	local to = tbl11.to
																	local navIndicator = tab.navIndicator
																	local spring = tbl11.Presets.Spring
																	local tbl29 = {}
																	backgroundTransparency = backgroundTransparency and UDim2.fromOffset(3, 30) or UDim2.fromOffset(3, 0)
																	tbl29.Size = backgroundTransparency
																	to(navIndicator, spring, tbl29)
																end
															elseif flag24 then
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and v82[192] or 0.78,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(255, 255, 255) or theme.Data.Sub,
																})

																if tab.navIndicator then
																	local to = tbl11.to
																	local navIndicator = tab.navIndicator
																	local spring = tbl11.Presets.Spring
																	local tbl29 = {}
																	backgroundTransparency = backgroundTransparency and UDim2.fromOffset(6, 6)
																	tbl29.Size = backgroundTransparency or UDim2.fromOffset(0, 0)
																	to(navIndicator, spring, tbl29)
																end
															elseif flag25 then
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and 0.84 or 1,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(255, 255, v82[14]) or theme.Data.Sub,
																})

																if tab.navIndicator then
																	tbl11.to(tab.navIndicator, tbl11.Presets.Spring, {
																		Size = backgroundTransparency and UDim2.fromOffset(v82[24], v82[24]) or UDim2.fromOffset(0, v82[63]),
																	})
																end
															elseif flag26 then
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and ((layout == 1 or layout == 4) and 0.18 or 0.72) or 1,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(255, 255, 255) or theme.Data.Sub,
																})

																if tab.navIndicator then
																	local to = tbl11.to
																	local navIndicator = tab.navIndicator
																	local spring = tbl11.Presets.Spring

																	local tbl29 = {
																		Size = backgroundTransparency and UDim2.new(1, -v82[172], v82[63], 2.5) or UDim2.new(v82[63], 0, v82[63], 2.5),
																	}

																	backgroundTransparency = backgroundTransparency and 0 or v82[103]
																	tbl29.BackgroundTransparency = backgroundTransparency
																	to(navIndicator, spring, tbl29)
																end
															else
																tbl11.to(tab.navBtn, tbl11.Presets.Smooth, {
																	BackgroundTransparency = backgroundTransparency and 0.82 or 1,
																	TextColor3 = backgroundTransparency and Color3.fromRGB(255, 255, 255) or theme.Data.Sub,
																})
															end
														end
													end

													if layout == 3 and arg.activeTab then
														if arg._arrowLabel then
															arg._arrowLabel.Text = arg.activeTab.name
														end

														if arg._arrowCounter then
															arg._arrowCounter.Text = arg.activeTab.index .. " / " .. #arg.tabs
														end
													end

													if (layout == 6 or layout == v82[112]) and arg._dropHeadLabel and arg.activeTab then
														arg._dropHeadLabel.Text = arg.activeTab.name
													end

													if layout == 10 and arg._vArrowCounter and arg.activeTab then
														arg._vArrowCounter.Text = arg.activeTab.index .. "\n/\n" .. #arg.tabs
													end
												end

												index.SetLayout = function(arg, arg2)
													arg.layout = math.clamp(tonumber(arg2) or 1, 1, 16)
													arg:_rebuildNav()
												end

												index._setupDrag = function(arg)
													local flag23 = false
													local position = nil
													local position2 = nil
													local position3 = arg.main.Position
													local vector2 = Vector2.zero
													local vector22 = Vector2.zero

													local function fn61(input)
														if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
															flag23 = v82[173]
															position = input.Position
															position2 = arg.main.Position
															position3 = arg.main.Position
															vector22 = input.Position
															vector2 = Vector2.zero
															arg.outline:brighten(true)

															if not arg._minimized then
																tbl11.to(arg.main, tbl11.Presets.Snappy, { Size = UDim2.fromOffset(arg._w * v82[135], arg._h * v82[135]) })
															end
														end
													end

													table.insert(arg._conns, arg.main.InputBegan:Connect(fn61))
													table.insert(arg._conns, arg.titleBar.InputBegan:Connect(fn61))

													if arg.headerCard then
														table.insert(arg._conns, arg.headerCard.InputBegan:Connect(fn61))
													end

													if arg.content then
														table.insert(arg._conns, arg.content.InputBegan:Connect(fn61))
													end

													table.insert(arg._conns, UserInputService.InputChanged:Connect(function(input)
														local flag24 = flag23

														if flag23 then
															flag24 = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
														end

														if flag24 then
															local n35 = input.Position - position
															position3 = UDim2.new(position2.X.Scale, position2.X.Offset + n35.X, position2.Y.Scale, position2.Y.Offset + n35.Y)
															vector2 = Vector2.new(input.Position.X - vector22.X, input.Position.Y - vector22.Y)
															vector22 = Vector2.new(input.Position.X, input.Position.Y)
														end
													end))

													table.insert(arg._conns, UserInputService.InputEnded:Connect(function(input)
														if flag23 and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
															flag23 = v82[139]
															arg.outline:brighten(v82[139])

															if arg._minimized then
																tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, 58) })
															else
																tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, arg._h) })
															end

															tbl20.guiPosition = {
																xScale = arg.main.Position.X.Scale,
																xOffset = arg.main.Position.X.Offset,
																yScale = arg.main.Position.Y.Scale,
																yOffset = arg.main.Position.Y.Offset,
															}

															fn31()
														end
													end))

													table.insert(arg._conns, service.RenderStepped:Connect(function()
														if flag23 then
															arg.main.Position = arg.main.Position:Lerp(position3, 0.25)
														end
													end))
												end

												index._setupResize = function(arg)
													local flag23 = false
													local mouseLocation = nil
													local w = nil
													local v96 = nil
													local n35 = nil

													table.insert(arg._conns, arg.resizeHandle.InputBegan:Connect(function(input)
														if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
															flag23 = true
															mouseLocation = UserInputService:GetMouseLocation()
															local h = arg._h
															w = arg._w
															v96 = h
															local n36 = arg.main.AbsolutePosition + arg.main.AbsoluteSize / 2
															arg.main.Position = UDim2.fromOffset(n36.X, n36.Y)
															local v97 = v82[122]
															n35 = n36 - Vector2.new(w, v96) / v97
															arg.outline:brighten(v82[173])
														end
													end))

													table.insert(arg._conns, UserInputService.InputEnded:Connect(function(input)
														if flag23 and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
															flag23 = false
															arg.outline:brighten(false)
														end
													end))

													table.insert(arg._conns, UserInputService.InputChanged:Connect(function(input)
														if flag23 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
															local viewportSize = workspace.CurrentCamera.ViewportSize
															local mouseLocation2 = UserInputService:GetMouseLocation()
															local w2 = math.clamp(w + mouseLocation2.X - mouseLocation.X, arg.minW, viewportSize.X - 20)
															local h = math.clamp(v96 + mouseLocation2.Y - mouseLocation.Y, arg.minH, viewportSize.Y - v82[79])
															local v97 = arg
															arg._w = w2
															v97._h = h
															local n36 = n35 + Vector2.new(w2, h) / 2
															arg.main.Size = UDim2.fromOffset(w2, h)
															arg.main.Position = UDim2.fromOffset(n36.X, n36.Y)
														end
													end))
												end

												index._playOpen = function(arg)
													local udim2 = UDim2.fromOffset(arg._w, arg._h)
													local position = arg.main.Position
													arg.main.Size = UDim2.fromOffset(arg._w * v82[98], arg._h * 0.95)
													arg.main.Position = position + UDim2.fromOffset(v82[63], 24)
													arg.main.BackgroundTransparency = v82[103]
													arg.bg.ImageTransparency = 1
													arg.outline.stroke.Transparency = 1
													tbl11.to(arg.main, tbl11.Presets.Spring, { Size = udim2, Position = position })
													tbl11.to(arg.main, tbl11.Presets.Smooth, { BackgroundTransparency = 0 })
													tbl11.to(arg.bg, tbl11.Presets.Slow, { ImageTransparency = arg.bgTransparency })
													tbl11.to(arg.outline.stroke, tbl11.Presets.Smooth, { Transparency = 0.35 })
												end

												index.close = function(arg)
													tbl11.to(arg.main, TweenInfo.new(v82[4], Enum.EasingStyle.Back, Enum.EasingDirection.In), {
														Size = UDim2.fromOffset(arg._w * v82[130], arg._h * 0.4),
														BackgroundTransparency = 1,
														Position = arg.main.Position + UDim2.fromOffset(0, v82[33]),
													})

													tbl11.to(arg.bg, tbl11.Presets.Snappy, { ImageTransparency = 1 })
													tbl11.to(arg.outline.stroke, tbl11.Presets.Snappy, { Transparency = 1 })

													for _, conn in ipairs(arg._conns) do
														if conn.Connected then
															conn:Disconnect()
														end
													end

													arg._conns = {}

													task.delay(v82[188], function()
														arg.outline:destroy()
														arg.gui:Destroy()
													end)
												end

												index.minimize = function(arg)
													arg._minimized = not arg._minimized
													local minimizeBtn = arg.titleBar and arg.titleBar:FindFirstChild("MinimizeBtn")

													if minimizeBtn then
														minimizeBtn.Text = arg._minimized and "+" or "—"
													end

													if arg._minimized then
														arg._restoreSize = arg.main.Size

														if arg._nav then
															arg._nav.Visible = v82[139]
														end

														arg.content.Visible = false
														arg.resizeHandle.Visible = false

														if arg.bg then
															arg.bg.Visible = v82[139]
														end

														tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, 58) })
													else
														if arg.bg then
															arg.bg.Visible = true
														end

														tbl11.to(arg.main, tbl11.Presets.Spring, { Size = arg._restoreSize or UDim2.fromOffset(arg._w, arg._h) })

														task.delay(0.18, function()
															if arg._minimized then
																return
															end

															if arg._nav then
																arg._nav.Visible = true
															end

															arg.content.Visible = true
															arg.resizeHandle.Visible = true
														end)
													end
												end

												index.maximize = function(arg)
													if arg._minimized then
														arg._minimized = v82[139]

														if arg._nav then
															arg._nav.Visible = true
														end

														arg.content.Visible = true
														arg.resizeHandle.Visible = true
													end

													arg._maxed = not arg._maxed

													if arg._maxed then
														arg._preMax = { arg._w, arg._h }
														local viewportSize = workspace.CurrentCamera.ViewportSize
														local w = math.min(arg._w * 1.25, viewportSize.X - 40)
														local h = math.min(arg._h * v82[19], viewportSize.Y - v82[33])
														arg._w = w
														arg._h = h
														tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, arg._h) })
													else
														local v96 = arg._preMax[2]
														arg._w = arg._preMax[1]
														arg._h = v96
														tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, arg._h) })
													end
												end

												index.SetSize = function(arg, arg2, arg3)
													local viewportSize = workspace.CurrentCamera.ViewportSize
													arg._w = math.clamp(arg2, arg.minW, viewportSize.X - 20)
													arg._h = math.clamp(arg3, arg.minH, viewportSize.Y - 20)
													tbl11.to(arg.main, tbl11.Presets.Spring, { Size = UDim2.fromOffset(arg._w, arg._h) })
												end

												index.SetScale = function(arg, arg2)
													arg._currentScale = math.clamp(tonumber(arg2) or 1, 0.4, 1.6)

													if arg.scaleInstance then
														arg.scaleInstance.Scale = arg._currentScale
													end
												end

												index.SetBackground = function(arg, bgIndex)
													if type(bgIndex) == "number" and tbl19.Backgrounds[bgIndex] then
														arg._bgIndex = bgIndex
														bgIndex = tbl19.Backgrounds[bgIndex]
													elseif type(bgIndex) == "number" then
														bgIndex = "rbxassetid://" .. bgIndex
													end

													arg._currentBgImage = tostring(bgIndex)
													tbl11.to(arg.bg, tbl11.Presets.Snappy, { ImageTransparency = 1 })

													task.delay(0.16, function()
														arg.bg.Image = arg._currentBgImage
														tbl11.to(arg.bg, tbl11.Presets.Smooth, { ImageTransparency = arg.bgTransparency })
													end)
												end

												index.SetImageTransparency = function(arg, arg2)
													arg.bgTransparency = math.clamp(arg2, 0, 1)
													tbl11.to(arg.bg, tbl11.Presets.Smooth, { ImageTransparency = arg.bgTransparency })
												end

												index.SetTheme = function(arg, arg2)
													arg.theme:Apply(arg2)
													arg:_highlightNav()

													if arg.sidebar then
														arg.sidebar:applyTheme()
													end
												end

												index.SetAccent = function(arg, arg2)
													arg.theme:SetAccent(arg2)
													arg:_highlightNav()

													if arg.sidebar then
														arg.sidebar:applyTheme()
													end
												end

												index.Notify = function(arg, arg2, arg3, arg4)
													arg.notify.push(arg2, arg3, arg4)
												end

												index.SideButton = function(arg, arg2, arg3, arg4)
													return arg.sidebar:addButton(arg2, arg3, arg4)
												end

												index.SetSideBarLocked = function(arg, arg2)
													arg.sidebar:setLocked(arg2)
												end

												index.SetSideBarScale = function(arg, arg2)
													arg.sidebar:setScale(arg2)
												end

												index.SetSideBarVisible = function(arg, arg2)
													arg.sidebar:setVisible(arg2)
												end

												index.SetSideButtonVisible = function(arg, arg2, arg3)
													arg.sidebar:setButtonVisible(arg2, arg3)
												end

												index.SetSideBarStyle = function(arg, arg2)
													arg.sidebar:setStyle(arg2)
												end

												index.GetSideButtonPositions = function(arg)
													return arg.sidebar:getPositions()
												end

												index.SetSideButtonPositions = function(arg, arg2)
													arg.sidebar:setPositions(arg2)
												end

												index.ResetSideButtons = function(arg)
													arg.sidebar:resetPositions()
												end

												index.OnSideButtonMoved = function(arg, onPositionChanged)
													arg.sidebar.onPositionChanged = onPositionChanged
												end

												ReplicatedStorage = game:GetService("ReplicatedStorage")
												service4 = game:GetService(v82[129])
												HttpService = game:GetService("HttpService")
												v83 = localPlayer
												playerGui = v83:WaitForChild("PlayerGui")
												color = Color3.fromRGB(126, 134, v82[14])

												do
													local touchEnabled = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled or workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X < v82[12] and UserInputService.TouchEnabled
													local n35 = touchEnabled and 0.7 or 1
													local n36 = touchEnabled and 0.85 or v82[103]

													if not (touchEnabled and v82[43]) then
													end

													flag22 = false

													tbl20 = {
														speedEnabled = true,
														speedProfile = "Normal",
														speedToggled = false,
														normalSpeed = 59,
														normalCarrySpeed = 29,
														laggerNormalSpeed = 35,
														laggerCarrySpeed = 15,
														customNormalSpeed = 70,
														customCarrySpeed = v82[29],
														autoBatSpeed = 65,
														autoBatDistance = 4,
														autoBatHeight = v82[63],
														autoBatPosition = "Default",
														tpBatDistance = 3.5,
														tpBatMaxRange = 45,
														tpBatSwingDelay = 0.2,
														speedSwitchMode = 1,
														circleEnabled = false,
														antiRagdollEnabled = false,
														_circleTrack = {
															conn = nil,
															target = nil,
															lastPos = nil,
															velocity = Vector3.zero,
														},
														medusaCounterEnabled = false,
														autoGrabEnabled = v82[139],
														autoGrabVersion = 2,
														autoGrabMode = "V1",
														autoHitEnabled = false,
														primeRange = 80,
														infJumpEnabled = false,
														infJumpMode = "Normal Mode",
														floatingBtnsVisible = true,
														phoneScale = n35,
														buttonScale = n36,
														sideBtnPositions = {},
														tpBatEnabled = false,
														autoTpDown = false,
														autoTpDownHeight = v82[29],
														bodyLockEnabled = false,
														bodyLockRange = v82[181],
														safeModeEnabled = true,
														antiDieEnabled = false,
														autoSwitchSpeedEnabled = v82[139],
														antiCollisionEnabled = true,
														playerSpeedEnabled = false,
														ragTimerEnabled = false,
														ragCountdownDur = 2.5,
														autoEquipBat = false,
														batCounterEnabled = false,
														batCounterVersion = v82[103],
														introEnabled = v82[139],
														guiWidth = 500,
														guiHeight = 600,
														fov = v82[42],
														stretchRez = v82[103],
														fpsBoostEnabled = false,
														currentAnimPack = "OFF",
														markerDisplayStyle = v82[126],
														autoWalkMode = 2,
														themeName = "Velvet Rose",
														accentName = "Velvet Rose",
														headlessEnabled = false,
														korbloxEnabled = v82[139],
														copyAvatarTarget = "realalameen",
														autoBatOnDropBrainrot = false,
														tpBatOnDropBrainrot = false,
														dropBrainrotMethod = "Ground Snap",
													}
												end
											end

											tbl21 = {
												speed = Enum.KeyCode.Q,
												laggerMode = Enum.KeyCode.R,
												customSpeedMode = Enum.KeyCode.None,
												circle = Enum.KeyCode.G,
												dropBrainrot = Enum.KeyCode.H,
												tpDown = Enum.KeyCode.T,
												walkLeft = Enum.KeyCode.Z,
												walkRight = Enum.KeyCode.C,
												tpBat = Enum.KeyCode.V,
												bodyLock = Enum.KeyCode.None,
												instaReset = Enum.KeyCode.None,
											}

											fn32 = nil
											fn33 = nil
											fn34 = nil
											fn35 = nil
											fn36 = nil
											fn37 = nil
											fn38 = nil
											fn39 = nil
											fn40 = nil
											v84 = nil

											tbl22 = {
												humanoid = nil,
												hrp = nil,
												speedLabel = nil,
												ragLabel = nil,
											}

											tbl24 = {
												active = v82[139],
												startTime = 0,
												phase = "idle",
												label = "",
												lastResult = "",
												lastResultTime = v82[63],
												cooldownUntil = v82[63],
												cancelGen = 0,
												scanGen = 0,
												suspendedAt = v82[63],
												activePrompt = nil,
												activeData = nil,
												holdThreads = {},
											}

											v95 = nil
											lagger = nil
											custom = nil
											carry = nil
											v85 = nil
											v86 = nil
											v89 = nil
											v88 = nil
											v87 = nil

											tbl23 = {
												active = false,
												waypoints = {},
												index = 1,
												useCarry = false,
												pauseTime = 0,
												connection = nil,
												currentPathName = nil,
												faceTarget = nil,
												holding = false,
												holdCF = nil,
											}

											flag20 = v82[139]
											flag21 = false

											do
												local flag23 = false
												local flag24 = v82[139]
												local v96 = nil

												local function fn61()
													local tbl29 = {
														speedEnabled = tbl20.speedEnabled,
														speedProfile = tbl20.speedProfile,
														speedToggled = tbl20.speedToggled,
														normalSpeed = tbl20.normalSpeed,
														normalCarrySpeed = tbl20.normalCarrySpeed,
														laggerNormalSpeed = tbl20.laggerNormalSpeed,
														laggerCarrySpeed = tbl20.laggerCarrySpeed,
														customNormalSpeed = tbl20.customNormalSpeed,
														customCarrySpeed = tbl20.customCarrySpeed,
														autoBatSpeed = tbl20.autoBatSpeed,
														autoBatDistance = tbl20.autoBatDistance,
														autoBatHeight = tbl20.autoBatHeight,
														autoBatPosition = tbl20.autoBatPosition,
														tpBatPower = tbl20.tpBatPower,
														tpBatDistance = tbl20.tpBatDistance,
														tpBatMaxRange = tbl20.tpBatMaxRange,
														tpBatSwingDelay = tbl20.tpBatSwingDelay,
														laggerCarryEnabled = tbl20.laggerCarryEnabled,
														tpBatEnabled = v82[139],
														circleEnabled = false,
														autoGrabEnabled = tbl20.autoGrabEnabled,
														autoGrabVersion = 2,
														autoHitEnabled = tbl20.autoHitEnabled,
														primeRange = tbl20.primeRange,
														autoGrabMode = tbl20.autoGrabMode,
														antiRagdollEnabled = tbl20.antiRagdollEnabled,
														medusaCounterEnabled = tbl20.medusaCounterEnabled,
														infJumpEnabled = tbl20.infJumpEnabled,
														infJumpMode = tbl20.infJumpMode,
														sideBtnPositions = tbl20.sideBtnPositions,
														phoneScale = tbl20.phoneScale,
														buttonScale = tbl20.buttonScale,
														floatingBtnsVisible = tbl20.floatingBtnsVisible,
														speedKey = fn60(tbl21.speed),
														laggerModeKey = fn60(tbl21.laggerMode),
														customSpeedModeKey = fn60(tbl21.customSpeedMode),
														circleKey = fn60(tbl21.circle),
														tpDownKey = fn60(tbl21.tpDown),
														walkLeftKey = fn60(tbl21.walkLeft),
														walkRightKey = fn60(tbl21.walkRight),
														tpBatKey = fn60(tbl21.tpBat),
														dropBrainrotKey = fn60(tbl21.dropBrainrot),
														dropBrainrotMethod = tbl20.dropBrainrotMethod or "Ground Snap",
														autoBatOnDropBrainrot = tbl20.autoBatOnDropBrainrot,
														tpBatOnDropBrainrot = tbl20.tpBatOnDropBrainrot,
													}

													tbl29.bodyLockKey = fn60(tbl21.bodyLock)
													tbl29.instaResetKey = fn60(tbl21.instaReset)
													tbl29.autoWalkMode = tbl20.autoWalkMode
													tbl29.playerSpeedEnabled = tbl20.playerSpeedEnabled
													tbl29.autoTpDown = tbl20.autoTpDown
													tbl29.autoTpDownHeight = tbl20.autoTpDownHeight
													tbl29.ragTimerEnabled = tbl20.ragTimerEnabled
													tbl29.ragCountdownDur = tbl20.ragCountdownDur
													tbl29.autoEquipBat = tbl20.autoEquipBat
													tbl29.batCounterEnabled = tbl20.batCounterEnabled
													tbl29.batCounterVersion = 1
													tbl29.speedSwitchMode = tbl20.speedSwitchMode
													tbl29.guiWidth = tbl20.guiWidth
													tbl29.guiHeight = tbl20.guiHeight
													tbl29.introEnabled = tbl20.introEnabled
													tbl29.fov = tbl20.fov
													tbl29.stretchRez = tbl20.stretchRez
													tbl29.currentAnimPack = tbl20.currentAnimPack
													tbl29.autoGrabScale = tbl20.autoGrabScale
													tbl29.guiPosition = tbl20.guiPosition
													tbl29.bodyLockEnabled = tbl20.bodyLockEnabled
													tbl29.safeModeEnabled = tbl20.safeModeEnabled
													tbl29.antiDieEnabled = tbl20.antiDieEnabled
													tbl29.autoSwitchSpeedEnabled = tbl20.autoSwitchSpeedEnabled
													tbl29.bodyLockRange = tbl20.bodyLockRange
													tbl29.sideBtnVisibility = tbl20.sideBtnVisibility
													tbl29.mobileBtnStyle = tbl20.mobileBtnStyle
													tbl29.autoGrabPosition = tbl20.autoGrabPosition
													tbl29.autoGrabBarPosition = tbl20.autoGrabBarPosition
													tbl29.copyAvatarTarget = tbl20.copyAvatarTarget
													tbl29.antiCollisionEnabled = tbl20.antiCollisionEnabled
													tbl29.fpsBoostEnabled = tbl20.fpsBoostEnabled
													tbl29.themeName = tbl20.themeName
													tbl29.accentName = tbl20.accentName
													tbl29.lockSideButtons = tbl20.lockSideButtons
													tbl29.topScaleWidgetPos = tbl20.topScaleWidgetPos

													local ok, result = pcall(function()
														return HttpService:JSONEncode(tbl29)
													end)

													if not ok or not result then
														return
													end
													v96 = result

													pcall(function()
														if typeof(writefile) == "function" then
															writefile("Hookduels.json", result)
														end
													end)
												end

												fn31 = function(arg)
													flag23 = v82[173]

													if arg then
														flag23 = false
														fn61()
														return
													end

													if flag24 then
														return
													end
													flag24 = true

													task.spawn(function()
														while flag23 do
															flag23 = false
															task.wait(0.25)
														end

														fn61()
														flag24 = false
													end)
												end

												fn41 = function()
													pcall(function()
														if typeof(readfile) ~= "function" or typeof(isfile) ~= "function" then
															return
														end

														if not isfile("Hookduels.json") then
															return
														end
														local json = readfile("Hookduels.json")
														if not json or #json == 0 then
															return
														end

														local ok, result = pcall(function()
															return HttpService:JSONDecode(json)
														end)

														local flag25 = not ok

														if not flag25 then
															local v97 = v82[72]
															flag25 = type(result) ~= v97
														end

														if flag25 then
															return
														end

														if result.speedEnabled ~= nil then
															tbl20.speedEnabled = result.speedEnabled == v82[173]
														end

														if result.speedProfile ~= nil then
															tbl20.speedProfile = tostring(result.speedProfile)
														end

														if result.speedToggled ~= nil then
															tbl20.speedToggled = result.speedToggled == true
														end

														if result.normalSpeed ~= nil then
															tbl20.normalSpeed = tonumber(result.normalSpeed) or 59
														end

														if result.normalCarrySpeed ~= nil then
															tbl20.normalCarrySpeed = tonumber(result.normalCarrySpeed) or 29
														end

														if result.laggerNormalSpeed ~= nil then
															tbl20.laggerNormalSpeed = tonumber(result.laggerNormalSpeed) or 35
														end

														if result.laggerCarrySpeed ~= nil then
															tbl20.laggerCarrySpeed = tonumber(result.laggerCarrySpeed) or 15
														end

														if result.customNormalSpeed ~= nil then
															tbl20.customNormalSpeed = tonumber(result.customNormalSpeed) or 70
														end

														if result.customCarrySpeed ~= nil then
															tbl20.customCarrySpeed = tonumber(result.customCarrySpeed) or 35
														end

														if result.autoBatSpeed ~= nil then
															tbl20.autoBatSpeed = tonumber(result.autoBatSpeed) or tbl20.autoBatSpeed
														end

														if result.autoBatDistance ~= nil then
															tbl20.autoBatDistance = tonumber(result.autoBatDistance) or tbl20.autoBatDistance
														end

														if result.autoBatHeight ~= nil then
															tbl20.autoBatHeight = tonumber(result.autoBatHeight) or tbl20.autoBatHeight
														end

														if result.autoBatPosition ~= nil then
															tbl20.autoBatPosition = tostring(result.autoBatPosition)
														end

														if result.tpBatPower ~= nil then
															tbl20.tpBatPower = tonumber(result.tpBatPower) or tbl20.tpBatPower
														end

														if result.tpBatDistance ~= nil then
															tbl20.tpBatDistance = tonumber(result.tpBatDistance) or tbl20.tpBatDistance
														end

														if result.tpBatMaxRange ~= nil then
															tbl20.tpBatMaxRange = tonumber(result.tpBatMaxRange) or tbl20.tpBatMaxRange
														end

														if result.tpBatSwingDelay ~= nil then
															tbl20.tpBatSwingDelay = tonumber(result.tpBatSwingDelay) or tbl20.tpBatSwingDelay
														end

														if result.laggerCarryEnabled ~= nil then
															tbl20.laggerCarryEnabled = result.laggerCarryEnabled == true
														end

														tbl20.tpBatEnabled = v82[139]
														tbl20.circleEnabled = false
														tbl23.active = false

														if result.autoGrabEnabled ~= nil then
															tbl20.autoGrabEnabled = result.autoGrabEnabled == true
														end

														tbl20.autoGrabVersion = v82[122]

														if result.autoHitEnabled ~= nil then
															tbl20.autoHitEnabled = result.autoHitEnabled == true
														end

														if result.primeRange ~= nil then
															tbl20.primeRange = math.clamp(tonumber(result.primeRange) or 80, 5, 300)
														end

														if result.autoGrabMode == "V1" or result.autoGrabMode == "V2" or result.autoGrabMode == "V3" then
															tbl20.autoGrabMode = result.autoGrabMode
														end

														if result.antiRagdollEnabled ~= nil then
															tbl20.antiRagdollEnabled = result.antiRagdollEnabled == true
														end

														if result.medusaCounterEnabled ~= nil then
															tbl20.medusaCounterEnabled = result.medusaCounterEnabled == true
														end

														if result.infJumpEnabled ~= nil then
															tbl20.infJumpEnabled = result.infJumpEnabled == true
														end

														if result.infJumpMode ~= nil then
															tbl20.infJumpMode = tostring(result.infJumpMode)
														end

														if result.dropBrainrotMethod ~= nil then
															tbl20.dropBrainrotMethod = tostring(result.dropBrainrotMethod)
														end

														if result.autoBatOnDropBrainrot ~= nil then
															tbl20.autoBatOnDropBrainrot = result.autoBatOnDropBrainrot == true
														end

														if result.tpBatOnDropBrainrot ~= nil then
															tbl20.tpBatOnDropBrainrot = result.tpBatOnDropBrainrot == true
														end

														if result.sideBtnPositions and type(result.sideBtnPositions) == "table" then
															tbl20.sideBtnPositions = result.sideBtnPositions
														end

														if result.floatingBtnsVisible ~= nil then
															tbl20.floatingBtnsVisible = result.floatingBtnsVisible ~= false
														end

														if result.phoneScale ~= nil then
															tbl20.phoneScale = tonumber(result.phoneScale) or tbl20.phoneScale
														end

														if result.buttonScale ~= nil then
															tbl20.buttonScale = tonumber(result.buttonScale) or tbl20.buttonScale
														end

														if result.autoWalkMode ~= nil then
															tbl20.autoWalkMode = tonumber(result.autoWalkMode) or tbl20.autoWalkMode
														end

														if result.playerSpeedEnabled ~= nil then
															tbl20.playerSpeedEnabled = result.playerSpeedEnabled == v82[173]
														end

														if result.autoTpDown ~= nil then
															tbl20.autoTpDown = result.autoTpDown == true
														end

														if result.autoTpDownHeight ~= nil then
															tbl20.autoTpDownHeight = math.clamp(tonumber(result.autoTpDownHeight) or 15, v82[70], 100)
														end

														if result.ragTimerEnabled ~= nil then
															tbl20.ragTimerEnabled = result.ragTimerEnabled == true
														end

														if result.ragCountdownDur ~= nil then
															tbl20.ragCountdownDur = math.clamp(tonumber(result.ragCountdownDur) or 2.5, v82[103], 10)
														end

														if result.autoEquipBat ~= nil then
															tbl20.autoEquipBat = result.autoEquipBat == true
														end

														if result.batCounterEnabled ~= nil then
															tbl20.batCounterEnabled = result.batCounterEnabled == true
														end

														tbl20.batCounterVersion = 1

														if result.speedSwitchMode ~= nil then
															tbl20.speedSwitchMode = math.clamp(tonumber(result.speedSwitchMode) or v82[103], 1, 2)
														end

														if result.guiWidth ~= nil then
															tbl20.guiWidth = math.clamp(tonumber(result.guiWidth) or 400, 300, 900)
														end

														if result.guiHeight ~= nil then
															tbl20.guiHeight = math.clamp(tonumber(result.guiHeight) or 540, 300, 900)
														end

														if tbl20.guiWidth == 400 or tbl20.guiWidth == 440 or tbl20.guiWidth == 460 or tbl20.guiWidth == 540 or tbl20.guiWidth == 600 then
															tbl20.guiWidth = 500
														end

														if tbl20.guiHeight == 480 or tbl20.guiHeight == 540 or tbl20.guiHeight == 640 or tbl20.guiHeight == v82[131] or tbl20.guiHeight == v82[8] or tbl20.guiHeight == 760 then
															tbl20.guiHeight = 600
														end

														if result.introEnabled ~= nil then
															tbl20.introEnabled = result.introEnabled ~= false
														end

														if result.fov ~= nil then
															tbl20.fov = math.clamp(tonumber(result.fov) or 80, 80, v82[109])
														end

														if result.stretchRez ~= nil then
															tbl20.stretchRez = math.clamp(tonumber(result.stretchRez) or 1, 0.1, 1)
														end

														if result.currentAnimPack ~= nil then
															tbl20.currentAnimPack = tostring(result.currentAnimPack)
														end

														if result.autoGrabScale ~= nil then
															tbl20.autoGrabScale = math.clamp(tonumber(result.autoGrabScale) or 1, 0.4, 2)
														end

														if result.guiPosition and type(result.guiPosition) == "table" then
															tbl20.guiPosition = result.guiPosition
														end

														if result.bodyLockEnabled ~= nil then
															tbl20.bodyLockEnabled = result.bodyLockEnabled == true
														end

														if result.safeModeEnabled ~= nil then
															tbl20.safeModeEnabled = result.safeModeEnabled == v82[173]
														end

														if result.autoSwitchSpeedEnabled ~= nil then
															tbl20.autoSwitchSpeedEnabled = result.autoSwitchSpeedEnabled == true
														end

														if result.antiDieEnabled ~= nil then
															tbl20.antiDieEnabled = result.antiDieEnabled == true
														end

														if result.bodyLockRange ~= nil then
															tbl20.bodyLockRange = math.clamp(tonumber(result.bodyLockRange) or v82[181], 10, 250)
														end

														if result.sideBtnVisibility and type(result.sideBtnVisibility) == "table" then
															tbl20.sideBtnVisibility = result.sideBtnVisibility
														end

														if result.mobileBtnStyle ~= nil then
															tbl20.mobileBtnStyle = tostring(result.mobileBtnStyle)
														end

														local autoGrabPosition = result.autoGrabPosition

														if autoGrabPosition then
															local v97 = v82[72]
															autoGrabPosition = type(result.autoGrabPosition) == v97
														end

														if autoGrabPosition then
															tbl20.autoGrabPosition = result.autoGrabPosition
														end

														local autoGrabBarPosition = result.autoGrabBarPosition

														if autoGrabBarPosition then
															local v97 = v82[72]
															autoGrabBarPosition = type(result.autoGrabBarPosition) == v97
														end

														if autoGrabBarPosition then
															tbl20.autoGrabBarPosition = result.autoGrabBarPosition
														end

														if result.copyAvatarTarget ~= nil then
															tbl20.copyAvatarTarget = tostring(result.copyAvatarTarget)
														end

														if result.antiCollisionEnabled ~= nil then
															tbl20.antiCollisionEnabled = result.antiCollisionEnabled == true
														end

														if result.fpsBoostEnabled ~= nil then
															tbl20.fpsBoostEnabled = result.fpsBoostEnabled == true
														end

														if result.themeName ~= nil then
															tbl20.themeName = tostring(result.themeName)
														end

														if result.accentName ~= nil then
															tbl20.accentName = tostring(result.accentName)
														end

														if result.lockSideButtons ~= nil then
															tbl20.lockSideButtons = result.lockSideButtons == v82[173]
														end

														if result.topScaleWidgetPos and type(result.topScaleWidgetPos) == "table" then
															tbl20.topScaleWidgetPos = result.topScaleWidgetPos
														end

														local function fn62(arg)
															if type(arg) ~= "string" then
																return nil
															end

															if arg == "None" or arg == "" then
																return Enum.KeyCode.None
															end

															if arg:match("^MouseButton%d+$") then
																return arg
															end

															local ok2, result2 = pcall(function()
																return Enum.KeyCode[arg]
															end)

															return ok2 and result2 or nil
														end

														local function fn63(arg, arg2)
															local v97 = fn62(result[arg2])

															if v97 ~= nil then
																tbl21[arg] = v97
															end
														end

														fn63("speed", "speedKey")
														fn63("laggerMode", "laggerModeKey")
														fn63(v82[50], "customSpeedModeKey")
														fn63(v82[26], "circleKey")
														fn63(v82[195], "tpDownKey")
														fn63("walkLeft", "walkLeftKey")
														fn63("walkRight", "walkRightKey")
														fn63("tpBat", v82[100])
														fn63("dropBrainrot", "dropBrainrotKey")
														fn63(v82[7], "bodyLockKey")
														fn63("instaReset", "instaResetKey")
														local setState = nil

														if v85 then
															setState = v85.setState
														end

														if setState then
															pcall(function()
																v85.setState(tbl20.speedToggled)
															end)
														end

														if carry and carry.setState then
															pcall(function()
																carry.setState(tbl20.speedToggled)
															end)
														end

														flag22 = v82[173]
													end)
												end

												pcall(fn41)

												pcall(function()
													v83.OnTeleport:Connect(function()
														pcall(fn61)
													end)
												end)
											end
										end
									end

									do
										local fn55, fn56

										do
											do
												fn53 = function(arg, arg2)
													local flag22 = false
													local position = nil
													local position2 = nil
													local v96 = nil

													arg.InputBegan:Connect(function(input)
														if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
															flag22 = v82[173]
															position = input.Position
															position2 = arg.Position

															input.Changed:Connect(function()
																if input.UserInputState == Enum.UserInputState.End then
																	flag22 = false

																	if arg2 then
																		arg2(arg.Position)
																	end
																end
															end)
														end
													end)

													arg.InputChanged:Connect(function(input)
														if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
															v96 = input
														end
													end)

													UserInputService.InputChanged:Connect(function(input)
														if input == v96 and flag22 then
															local n35 = input.Position - position
															arg.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n35.X, position2.Y.Scale, position2.Y.Offset + n35.Y)
														end
													end)

													UserInputService.InputEnded:Connect(function(input)
														if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and flag22 then
															flag22 = false

															if arg2 then
																arg2(arg.Position)
															end
														end
													end)
												end

												fn55 = function()
												end

												fn42 = function(speedProfile)
													if speedProfile ~= "Normal" and speedProfile ~= "Lagger" and speedProfile ~= "Custom" then
														speedProfile = v82[32]
													end

													tbl20.speedProfile = speedProfile
													local setState = nil

													if v95 then
														setState = v95.setState
													end

													if setState then
														pcall(function()
															v95.setState(speedProfile == v82[199])
														end)
													end

													if lagger and lagger.setState then
														pcall(function()
															lagger.setState(speedProfile == "Lagger")
														end)
													end

													if custom and custom.setState then
														pcall(function()
															custom.setState(speedProfile == v82[187])
														end)
													end

													fn31()
												end

												fn43 = function()
													if tbl20.speedProfile == "Lagger" then
														fn42("Normal")
													else
														fn42("Lagger")
													end
												end

												fn44 = function()
													if tbl20.speedProfile == v82[187] then
														fn42("Normal")
													else
														fn42("Custom")
													end
												end

												do
													local function fn57()
														local flag22 = tbl20.speedToggled == true
														local flag23

														if tbl20.autoSwitchSpeedEnabled then
															local character = v83.Character
															character = character and character:FindFirstChildOfClass("Humanoid")

															if character and character.WalkSpeed < v82[27] then
																flag23 = true
															else
																flag23 = flag22
															end
														else
															flag23 = flag22
														end

														return flag23
													end

													fn48 = function()
														local speedProfile = tbl20.speedProfile or "Normal"
														if not flag2 then
															return
														end
														local laggerCarrySpeed = fn57()
														if speedProfile == v82[199] then
															laggerCarrySpeed = laggerCarrySpeed and (tbl20.laggerCarrySpeed or 15) or tbl20.laggerNormalSpeed or 35
															return laggerCarrySpeed
														end

														if speedProfile == "Custom" then
															laggerCarrySpeed = laggerCarrySpeed and (tbl20.customCarrySpeed or 35)
															return laggerCarrySpeed or tbl20.customNormalSpeed or 70
														end
														return laggerCarrySpeed and (tbl20.normalCarrySpeed or v82[97]) or tbl20.normalSpeed or 59
													end
												end
											end

											do
												local raycastParams = RaycastParams.new()
												raycastParams.FilterType = Enum.RaycastFilterType.Exclude
												raycastParams.IgnoreWater = true

												pcall(function()
													raycastParams.RespectCanCollide = true
												end)

												local tbl26 = {}
												local vector = Vector3.zero

												local function fn57(arg, arg2, arg3, arg4)
													local ok, result = pcall(function()
														local filterDescendantsInstances = { arg2 }

														for _, player in ipairs(service2:GetPlayers()) do
															if player ~= v83 and player.Character then
																table.insert(filterDescendantsInstances, player.Character)
															end
														end

														raycastParams.FilterDescendantsInstances = filterDescendantsInstances
														return workspace:Raycast(arg.Position, arg3 * (v82[171] + math.min(arg4 or 60, v82[74]) * 0.035), raycastParams)
													end)

													if not ok or not result then
														return arg3
													end

													if result.Position.Y < arg.Position.Y - 1.2 then
														return arg3
													end
													local normal = result.Normal
													local x = normal.X
													local z = normal.Z
													local v96 = math.sqrt(x * x + z * z)
													if v96 < 0.05 then
														return arg3
													end
													local n35 = x / v96
													local n36 = z / v96
													local n37 = arg3.X * n35 + arg3.Z * n36
													if n37 >= 0 then
														return arg3
													end
													local n38 = arg3.X - n35 * n37
													local n39 = arg3.Z - n36 * n37
													if math.sqrt(n38 * n38 + n39 * n39) < 0.15 then
														return Vector3.zero
													end
													local v97 = math.sqrt(n38 * n38 + n39 * n39)
													return Vector3.new(n38 / v97, 0, n39 / v97)
												end

												fn56 = function()
													for _, v96 in ipairs(tbl26) do
														pcall(function()
															v96:Disconnect()
														end)
													end

													tbl26 = {}
													local character = v83.Character
													if not character then
														return
													end
													local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
													if not humanoidRootPart then
														return
													end

													pcall(function()
														local v96 = getrawmetatable(humanoidRootPart)
														setreadonly(v96, false)
														local index2 = v96.__index
														local newindex = v96.__newindex

														v96.__index = newcclosure(function(arg, arg2)
															if arg == humanoidRootPart and (arg2 == v82[116] or arg2 == "Velocity") then
																local ok, result = pcall(checkcaller)

																if ok and result then
																	local ok2, result2 = pcall(index2, arg, arg2)
																	if ok2 then
																		return result2
																	end
																elseif tbl20.speedEnabled ~= false then
																	return vector
																end
															end

															local ok, result = pcall(index2, arg, arg2)
															if ok then
																return result
															end
															return vector
														end)

														v96.__newindex = newcclosure(function(arg, arg2, arg3)
															if arg == humanoidRootPart and (arg2 == "AssemblyLinearVelocity" or arg2 == "Velocity") then
																local ok, result = pcall(checkcaller)

																if ok and result then
																	if pcall(newindex, arg, arg2, arg3) then
																		return
																	end
																elseif tbl20.speedEnabled ~= v82[139] then
																	vector = arg3
																	return
																end
															end

															pcall(newindex, arg, arg2, arg3)
														end)
													end)

													local connection = service.PreSimulation:Connect(function()
														if tbl20.speedEnabled == v82[139] then
															return
														end

														if tbl23 and tbl23.active then
															return
														end

														if flag21 then
															return
														end

														if tbl20.circleEnabled then
															return
														end
														local humanoid = tbl22.humanoid and tbl22.humanoid.Parent and tbl22.humanoid or character:FindFirstChildOfClass("Humanoid")

														if humanoid and humanoid.Health > 0 and humanoidRootPart and humanoidRootPart.Parent then
															if humanoidRootPart.Position.Y < -20 then
																if fn40 then
																	fn40(true)
																end

																return
															end

															local v96 = fn48()

															if v96 >= 15.5 and v96 <= 16.5 then
																if vector ~= Vector3.zero then
																	vector = Vector3.zero
																end

																return
															end

															local moveDirection = humanoid.MoveDirection
															local magnitude = moveDirection.Magnitude

															if magnitude > 0.05 then
																local y = humanoidRootPart.AssemblyLinearVelocity.Y

																if y ~= y then
																	y = 0
																end

																local n35 = math.clamp(y, -80, 80)
																local v97 = fn57(humanoidRootPart, character, Vector3.new(moveDirection.X / magnitude, 0, moveDirection.Z / magnitude), v96)

																if v97.Magnitude < 0.05 then
																	vector = Vector3.new(v82[63], n35, 0)
																	humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, n35, 0)
																else
																	vector = Vector3.new(v97.X * v82[137], n35, v97.Z * 16)
																	humanoidRootPart.AssemblyLinearVelocity = Vector3.new(v97.X * v96, n35, v97.Z * v96)
																end
															elseif vector ~= Vector3.zero then
																vector = Vector3.zero
															end
														end
													end)

													table.insert(tbl26, connection)
												end

												pcall(fn56)

												v83.CharacterAdded:Connect(function()
													task.wait(v82[51])
													pcall(fn56)
												end)

												pcall(function()
													workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
														if workspace.Gravity > 300 then
															workspace.Gravity = 196.2
														end
													end)

													if workspace.Gravity > 300 then
														workspace.Gravity = 196.2
													end
												end)

												fn54 = function(arg, arg2, arg3, arg4, arg5)
													if not arg or not arg3 then
														return
													end
													local y = arg.AssemblyLinearVelocity.Y

													if y ~= y then
														if n25 >= 7846 then
															while true do
															end
														else
															y = v82[63]
														end
													end

													if v82[51] < arg4.Magnitude then
														local unit = arg4.Unit
														local vector2 = Vector3.new(unit.X, 0, unit.Z)
														local unit2

														if vector2.Magnitude > 0.05 then
															unit2 = vector2.Unit
														else
															unit2 = Vector3.zero
														end

														local vector3 = unit2.Magnitude > v82[51] and fn57(arg, arg3, unit2, arg5) or Vector3.zero

														if vector3.Magnitude < v82[51] then
															vector = Vector3.new(0, y, 0)
															arg.AssemblyLinearVelocity = Vector3.new(0, y, 0)
														else
															vector = Vector3.new(vector3.X * 16, y, vector3.Z * 16)
															arg.AssemblyLinearVelocity = Vector3.new(vector3.X * arg5, y, vector3.Z * arg5)
														end
													else
														vector = Vector3.new(0, y, v82[63])
													end
												end
											end
										end

										do
											local function fn57()
												pcall(fn56)
											end

											v83.CharacterAdded:Connect(function(character)
												task.wait(0.05)
												local humanoid = character:WaitForChild("Humanoid", 10)

												if humanoid and tbl20.antiDieEnabled then
													pcall(function()
														humanoid.RequiresNeck = false
														humanoid.BreakJointsOnDeath = false
														humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
													end)
												end

												pcall(function()
													local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
													local head = character:FindFirstChild("Head")

													if torso then
														torso.CanCollide = true
													end

													if head then
														head.CanCollide = v82[173]
													end
												end)
											end)

											fn45 = function(character)
												fn55()
												cachedMoveDirection = Vector3.zero
												cachedInputTime = v82[63]
												local v96 = tbl22
												local v97 = tbl22
												tbl22.humanoid = nil
												v96.hrp = nil
												v97.speedLabel = nil
												local v98 = tbl22
												tbl22.lastPos = nil
												v98.lastTime = nil
												local humanoid = character:WaitForChild("Humanoid", v82[21])
												local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
												if not (humanoid and humanoidRootPart) then
													return
												end
												tbl22.humanoid = humanoid
												tbl22.hrp = humanoidRootPart
												local head = character:FindFirstChild("Head") or character:WaitForChild("Head", v82[21])

												if head then
													local speedBillboard = head:FindFirstChild("SpeedBillboard")

													if speedBillboard then
														speedBillboard:Destroy()
													end

													local billboardGui = Instance.new("BillboardGui")
													billboardGui.Name = "SpeedBillboard"
													billboardGui.Size = UDim2.new(0, 220, 0, v82[42])
													billboardGui.StudsOffset = Vector3.new(0, 3, 0)
													billboardGui.AlwaysOnTop = true
													billboardGui.ResetOnSpawn = v82[139]
													billboardGui.Parent = head
													local textLabel = Instance.new("TextLabel")
													textLabel.Name = "RagdollLabel"
													textLabel.Size = UDim2.new(1, 0, v82[183], v82[63])
													textLabel.Position = UDim2.new(0, v82[63], 0, v82[63])
													textLabel.BackgroundTransparency = 1
													textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
													textLabel.Font = Enum.Font.MontserratBlack
													textLabel.TextScaled = true
													textLabel.TextStrokeTransparency = 0
													textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
													textLabel.Text = "2.5s"
													textLabel.Visible = v82[139]
													textLabel.Parent = billboardGui
													tbl22.ragLabel = textLabel
													local textLabel2 = Instance.new("TextLabel")
													textLabel2.Name = "DiscordLabel"
													textLabel2.Size = UDim2.new(1, 0, 0.32, 0)
													textLabel2.Position = UDim2.new(0, 0, v82[183], 0)
													textLabel2.BackgroundTransparency = 1
													textLabel2.Text = "discord.gg/hookduels"
													textLabel2.TextColor3 = Color3.fromRGB(255, 255, v82[14])
													textLabel2.Font = Enum.Font.MontserratBlack
													textLabel2.TextScaled = true
													textLabel2.TextStrokeTransparency = v82[63]
													textLabel2.Parent = billboardGui
													local textLabel3 = Instance.new("TextLabel")
													textLabel3.Name = "SpeedLabel"
													textLabel3.Size = UDim2.new(1, 0, v82[4], v82[63])
													textLabel3.Position = UDim2.new(v82[63], 0, v82[182], 0)
													textLabel3.BackgroundTransparency = 1
													textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
													textLabel3.Font = Enum.Font.MontserratBlack
													textLabel3.TextScaled = v82[173]
													textLabel3.TextStrokeTransparency = 0
													textLabel3.AutoLocalize = false
													textLabel3.Text = "Speed: 0.0"
													textLabel3.Parent = billboardGui
													tbl22.speedLabel = textLabel3

													pcall(function()
														humanoid.Died:Connect(function()
															pcall(function()
																billboardGui.Enabled = false
															end)
														end)
													end)
												end
											end

											v83.CharacterAdded:Connect(fn45)
											v83.CharacterRemoving:Connect(fn55)

											if v83.Character then
												task.spawn(fn45, v83.Character)
											end

											fn57()
										end
									end

									local n35 = 0

									service.RenderStepped:Connect(function(deltaTime)
										local speedLabel = tbl22.speedLabel
										local hrp = tbl22.hrp

										if not (speedLabel and hrp and hrp.Parent) then
											local character = v83.Character

											if character then
												hrp = character:FindFirstChild("HumanoidRootPart")
												tbl22.hrp = hrp
												local head = character:FindFirstChild("Head")
												head = head and head:FindFirstChild("SpeedBillboard")
												speedLabel = head and head:FindFirstChild("SpeedLabel")
												tbl22.speedLabel = speedLabel
											end
										end

										if not (speedLabel and hrp) then
											return
										end
										local humanoid = v83.Character and v83.Character:FindFirstChildOfClass("Humanoid")
										local n36

										if humanoid and humanoid.MoveDirection.Magnitude > v82[51] then
											if tbl20.speedEnabled ~= false then
												n36 = fn48()
											else
												n36 = v82[137]
											end
										else
											n36 = 0
										end

										n35 += (n36 - n35) * math.clamp((deltaTime or 0.016) * v82[137], 0, v82[103])

										if n35 < 0.15 then
											n35 = 0
										end

										local lastSpeedVal = math.floor(n35 * 10 + 0.5)

										if lastSpeedVal ~= tbl22._lastSpeedVal then
											tbl22._lastSpeedVal = lastSpeedVal
											speedLabel.Text = string.format("Speed: %.1f", lastSpeedVal / 10)
										end
									end)
								end

								do
									do
										local n35, v95, tbl26, tbl27

										do
											do
												n35 = 1
												v95 = v82[190]
												tbl26 = {}

												do
													local vector = Vector3.new(-475.25999755859374, -9.1400003433227539, 92.949996948242188)
													local vector2 = Vector3.new(-485.0200134277344, -7.8899998664855957, 93.620002746582031)
													local vector3 = Vector3.new(-477.010009765625, -8.9300003051757812, 93.069999694824219)
													local vector4 = Vector3.new
													tbl26[1] = vector
													tbl26[2] = vector2
													tbl26[3] = vector3

													do
														local values = table.pack(vector4(-475.26998901367188, -6.5799999237060547, 21.549999237060547))
														table.move(values, 1, values.n, 4, tbl26)
													end
												end
											end

											tbl27 = {}

											do
												local vector = Vector3.new(-475.2299865722656, -9.0100002288818359, 28.510000228881836)
												local vector2 = Vector3.new(-485.02999877929688, -7.8899998664855957, 27.790000915527344)
												local vector3 = Vector3.new(-476.92001342773438, -8.9700002670288086, 28.030000686645508)
												local vector4 = Vector3.new
												tbl27[1] = vector
												tbl27[2] = vector2
												tbl27[3] = vector3

												do
													local values = table.pack(vector4(-476.17999267578125, -6.0999999046325684, 97.730003356933594))
													table.move(values, 1, values.n, 4, tbl27)
												end
											end
										end

										do
											local tbl28

											do
												do
													local vector = Vector3.new

													tbl28 = {
														left = {
															Vector3.new(-476.48, -6.28, 92.73),
															vector(-483.12, -4.95, 94.8),
														},
														right = {
															Vector3.new(-476.16, -6.52, 25.62),
															vector(-483.06, -5.03, 25.48),
														},
														leftFace = Vector3.new(-482.25, -4.96, 92.09),
														rightFace = Vector3.new(-482.06, -6.93, 35.47),
													}
												end
											end

											local fn55, fn56

											do
												fn49 = function()
													if tbl23.connection then
														tbl23.connection:Disconnect()
													end

													local active = tbl20.autoWalkMode == v82[122] and tbl23.active
													tbl23.active = v82[139]
													tbl23.waypoints = {}
													tbl23.index = 1
													tbl23.useCarry = v82[139]
													tbl23.pauseTime = 0
													tbl23.currentPathName = nil
													tbl23.connection = nil
													tbl23.faceTarget = nil
													tbl23.holding = false
													tbl23.holdCF = nil

													if v84 then
														v84.PlaneVelocity = Vector2.zero
														v84.Enabled = false
													end

													if active and tbl20.autoSwitchSpeedEnabled then
														tbl20.speedToggled = true
														local setState = nil

														if v85 then
															setState = v85.setState
														end

														if setState then
															pcall(function()
																v85.setState(true)
															end)
														end

														if carry and carry.setState then
															pcall(function()
																carry.setState(true)
															end)
														end

														fn31()
													end
												end

												do
													local function fn57(arg, currentPathName, faceTarget)
														if tbl23.active and tbl23.currentPathName == currentPathName then
															fn49()
															return
														end
														fn49()
														if not arg or #arg == 0 then
															return
														end
														tbl23.waypoints = table.clone(arg)
														tbl23.index = 1
														tbl23.useCarry = v82[139]
														tbl23.pauseTime = 0.07
														tbl23.active = true
														tbl23.currentPathName = currentPathName
														tbl23.faceTarget = faceTarget

														tbl23.connection = service.RenderStepped:Connect(function(deltaTime)
															if not tbl23.active then
																return
															end
															local character = v83.Character
															if not character then
																fn49()
																return
															end
															local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
															if not humanoidRootPart then
																return
															end

															if #tbl23.waypoints < tbl23.index then
																local faceTarget2 = tbl23.faceTarget
																if not faceTarget2 then
																	fn49()
																	return
																end

																if not tbl23.holding then
																	tbl23.holding = v82[173]

																	if tbl20.autoWalkMode == 2 then
																		tbl20.speedToggled = true
																		local setState

																		if v85 then
																			setState = v85.setState
																		end

																		if setState then
																			pcall(function()
																				v85.setState(true)
																			end)
																		end

																		if carry and carry.setState then
																			pcall(function()
																				carry.setState(true)
																			end)
																		end

																		fn31()
																	end

																	pcall(function()
																		local position = humanoidRootPart.Position
																		local vector = Vector3.new(faceTarget2.X, position.Y, faceTarget2.Z)

																		if (vector - position).Magnitude > 0.05 then
																			humanoidRootPart.CFrame = CFrame.new(position, vector)
																		end
																	end)
																end

																local humanoid = character:FindFirstChildOfClass("Humanoid")
																if not humanoid or humanoid.Health <= v82[63] then
																	fn49()
																	return
																end
																local state = humanoid:GetState()
																if humanoid.MoveDirection.Magnitude > 0.05 or state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll then
																	fn49()
																	return
																end

																if v84 then
																	v84.PlaneVelocity = Vector2.zero
																	v84.Enabled = false
																end

																humanoidRootPart.AssemblyLinearVelocity = Vector3.new(v82[63], humanoidRootPart.AssemblyLinearVelocity.Y, 0)
																return
															end

															local v96 = tbl23.waypoints[tbl23.index]
															local position = humanoidRootPart.Position

															if Vector3.new(v96.X - position.X, 0, v96.Z - position.Z).Magnitude <= n35 then
																if tbl23.index == 2 then
																	tbl23.pauseTime = v95
																end

																tbl23.index = tbl23.index + 1

																if tbl23.index > 2 and not tbl23.useCarry then
																	tbl23.useCarry = v82[173]
																end

																return
															end

															if tbl23.pauseTime > 0 then
																tbl23.pauseTime = tbl23.pauseTime - deltaTime

																if v84 then
																	v84.PlaneVelocity = Vector2.zero
																	v84.Enabled = false
																end

																humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, humanoidRootPart.AssemblyLinearVelocity.Y, v82[63])
																return
															end

															local unit = ((v96 - position) * Vector3.new(1, 0, 1)).Unit
															local normalSpeed = tbl20.normalSpeed or 59
															fn54(humanoidRootPart, character:FindFirstChildOfClass("Humanoid"), character, unit, normalSpeed, deltaTime)
														end)
													end

													fn55 = function()
														if tbl20.circleEnabled then
															fn32(false)
														end

														if tbl20.autoWalkMode == 2 then
															fn57(tbl28.left, "left", tbl28.leftFace)
														else
															fn57(tbl26, "left")
														end
													end

													fn56 = function()
														if tbl20.circleEnabled then
															fn32(v82[139])
														end

														if tbl20.autoWalkMode == 2 then
															fn57(tbl28.right, "right", tbl28.rightFace)
														else
															fn57(tbl27, "right")
														end
													end
												end
											end

											do
												local function fn57()
													local v96 = string.lower(v83.Name)
													local v97 = string.lower(v83.DisplayName)
													local plots = workspace:FindFirstChild("Plots") or workspace:FindFirstChild("plots")

													if plots then
														for _, child in pairs(plots:GetChildren()) do
															local plotSign = child:FindFirstChild("PlotSign") or child:FindFirstChild("Sign")
															local flag22 = false

															if plotSign then
																local yourBase = plotSign:FindFirstChild("YourBase")

																if yourBase and yourBase:IsA("BillboardGui") and yourBase.Enabled then
																	flag22 = v82[173]
																end

																if not flag22 then
																	for _, descendant in pairs(plotSign:GetDescendants()) do
																		if descendant:IsA("TextLabel") and descendant.Text ~= "" and descendant.Text ~= "Empty Base" then
																			local v98 = string.lower(descendant.Text)
																			if string.find(v98, v96, v82[103], true) or string.find(v98, v97, 1, v82[173]) then
																				flag22 = v82[173]
																				break
																			end
																		end
																	end
																end
															end

															if flag22 then
																local spawn_ = child:FindFirstChild("Spawn") or child:FindFirstChild("Plot") or child:FindFirstChild("Base") or child:IsA("Model") and child.PrimaryPart
																spawn_ = spawn_ and spawn_.Position.Z
																local z

																if spawn_ then
																	z = spawn_
																else
																	z = child:IsA("Model") and child:GetPivot().Position.Z
																end

																if z then
																	return z < 50 and "RIGHT" or "LEFT"
																end
															end
														end
													end

													local character = v83.Character
													character = character and character:FindFirstChild("HumanoidRootPart")
													if character then
														return character.Position.Z < 50 and "RIGHT" or "LEFT"
													end
													return nil
												end

												fn46 = function()
													if tbl23.active then
														fn49()
														return
													end
													local v96 = fn57()

													if v96 == "RIGHT" then
														fn55()
													elseif v96 == "LEFT" then
														fn56()
													else
														local character = v83.Character
														character = character and character:FindFirstChild("HumanoidRootPart")

														if character and character.Position.Z < 50 then
															fn55()
														else
															fn56()
														end
													end
												end
											end
										end
									end

									local tbl26

									do
										do
											local vector = Vector3.new

											tbl26 = {
												Vector3.new(-487.583, -4.943, 97.694),
												vector(-487.828, -4.959, 23.77),
											}
										end
									end

									tbl25 = {}

									do
										local v95 = nil
										v92 = nil
										v91 = nil
										v90 = nil
										v94 = nil
										n32 = 0
										now2 = tick()
										n33 = 60
										v93 = v82[63]
										n34 = 45

										fn52 = function(arg, arg2)
											local markerColor = tbl20.markerColor or "White"

											if markerColor == "Accent" then
												local v96 = color
												local color2

												if color then
													color2 = v96
												else
													color2 = Color3.fromRGB(225, 45, 185)
												end

												return color2
											end

											if markerColor == "Neon Cyan" then
												return Color3.fromRGB(v82[63], 240, v82[14])
											end

											if markerColor == "Lime Green" then
												return Color3.fromRGB(v82[42], v82[14], 120)
											end

											if markerColor == "Hot Pink" then
												return Color3.fromRGB(v82[14], 80, 180)
											end

											if markerColor == "Dynamic" then
												local n35 = math.clamp(arg / math.max(arg2, 0.01), v82[63], 1)
												if n35 > 0.5 then
													return Color3.fromRGB(v82[14], math.floor(60 + (1 - (n35 - 0.5) * 2) * 160), 60)
												end
												return Color3.fromRGB(math.floor(60 + n35 * 2 * 195), 255, 60)
											end

											return Color3.fromRGB(255, 255, v82[14])
										end

										fn50 = function()
											local v96 = v95

											pcall(function()
												for _, child in ipairs(playerGui:GetChildren()) do
													if child.Name == "AutoGrabBarGui" and child ~= v96 then
														child:Destroy()
													end
												end
											end)

											pcall(function()
												local hui = gethui and gethui()

												if hui then
													for _, child in ipairs(hui:GetChildren()) do
														if child.Name == "AutoGrabBarGui" and child ~= v96 then
															child:Destroy()
														end
													end
												end
											end)
										end

										fn51 = function()
											if v95 then
												pcall(function()
													v95:Destroy()
												end)
											end

											v95 = nil
											v92 = nil
											v91 = nil
											v90 = nil
											v94 = nil
											local autoGrabBarGui = playerGui:FindFirstChild("AutoGrabBarGui")

											if autoGrabBarGui then
												pcall(function()
													autoGrabBarGui:Destroy()
												end)
											end

											pcall(function()
												local hui = gethui and gethui()

												if hui then
													local autoGrabBarGui2 = hui:FindFirstChild("AutoGrabBarGui")

													if autoGrabBarGui2 then
														autoGrabBarGui2:Destroy()
													end
												end
											end)

											fn50()
											local screenGui = Instance.new("ScreenGui")
											screenGui.Name = "AutoGrabBarGui"
											screenGui.ResetOnSpawn = v82[139]
											screenGui.DisplayOrder = 9990
											screenGui.IgnoreGuiInset = true
											screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

											pcall(function()
												local hui = gethui and gethui()

												if hui then
													screenGui.Parent = hui
												end
											end)

											if not screenGui.Parent then
												screenGui.Parent = playerGui
											end

											local frame = Instance.new("Frame")
											frame.Name = "BarContainer"
											frame.Size = UDim2.fromOffset(300, 36)

											local function fn55(arg, arg2)
												local num = tonumber(arg)
												if num ~= num or num == math.huge or num == -math.huge then
													return arg2
												end
												return num or arg2
											end

											local autoGrabBarPosition = tbl20.autoGrabBarPosition
											local v96 = v82[6]
											local n35 = -150
											local n36 = -115
											local n37 = 1
											local v97

											if type(autoGrabBarPosition) ~= "table" then
												v97 = v96
											else
												v97 = fn55(autoGrabBarPosition.xScale, v96)
												n35 = fn55(autoGrabBarPosition.xOffset, -150)
												n37 = fn55(autoGrabBarPosition.yScale, 1)
												n36 = fn55(autoGrabBarPosition.yOffset, -115)
											end

											local currentCamera = workspace.CurrentCamera
											currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

											if currentCamera.X < 200 or currentCamera.Y < v82[74] then
												currentCamera = Vector2.new(1280, 720)
											end

											local n38 = n37 * currentCamera.Y + n36
											local n39 = math.clamp(v97 * currentCamera.X + n35, 0, math.max(0, currentCamera.X - 300))
											local n40 = math.clamp(n38, 0, math.max(0, currentCamera.Y - v82[121]))
											frame.Position = UDim2.new(0, math.floor(n39), 0, math.floor(n40))
											frame.BackgroundColor3 = Color3.fromRGB(15, 15, v82[79])
											frame.BackgroundTransparency = v82[23]
											frame.BorderSizePixel = v82[63]
											frame.Active = v82[173]
											frame.ClipsDescendants = true
											local uiCorner = Instance.new("UICorner")
											uiCorner.CornerRadius = UDim.new(1, 0)
											uiCorner.Parent = frame
											local uiStroke = Instance.new("UIStroke")
											uiStroke.Thickness = 1.5
											uiStroke.Color = Color3.fromRGB(v82[29], 35, 45)
											uiStroke.Transparency = 0.25
											uiStroke.Parent = frame
											local frame2 = Instance.new("Frame")
											frame2.Name = "BarFill"
											frame2.Position = UDim2.new(0, v82[63], 0, 0)
											frame2.Size = UDim2.new(0, 0, 1, 0)
											frame2.BackgroundColor3 = color or Color3.fromRGB(190, 32, 168)
											frame2.BorderSizePixel = 0
											local uiCorner2 = Instance.new("UICorner")
											uiCorner2.CornerRadius = UDim.new(1, v82[63])
											uiCorner2.Parent = frame2
											local uiGradient = Instance.new("UIGradient")
											uiGradient.Rotation = v82[63]
											local new = ColorSequenceKeypoint.new
											local v98 = v82[103]
											local color2 = Color3.fromRGB

											uiGradient.Color = ColorSequence.new({
												ColorSequenceKeypoint.new(v82[63], Color3.fromRGB(255, 255, 255)),
												new(v98, color2(210, 210, 210)),
											})

											uiGradient.Parent = frame2
											frame2.Parent = frame
											local textLabel = Instance.new("TextLabel")
											textLabel.Name = "StealLabel"
											textLabel.Position = UDim2.fromOffset(v82[167], 0)
											textLabel.Size = UDim2.new(0, 65, v82[103], v82[63])
											textLabel.BackgroundTransparency = 1
											textLabel.Font = Enum.Font.MontserratBlack
											textLabel.Text = "STEAL"
											textLabel.TextSize = 13
											textLabel.TextColor3 = Color3.fromRGB(255, v82[14], 255)
											textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, v82[63])
											textLabel.TextStrokeTransparency = 0.3
											textLabel.TextXAlignment = Enum.TextXAlignment.Left
											textLabel.TextYAlignment = Enum.TextYAlignment.Center
											textLabel.ZIndex = 5
											textLabel.Parent = frame
											local instance = Instance.new(v82[61])
											instance.Name = "PercentLabel"
											instance.Position = UDim2.new(0.46, -25, v82[63], v82[63])
											instance.Size = UDim2.new(0, 55, 1, 0)
											instance.BackgroundTransparency = 1
											instance.Font = Enum.Font.MontserratBlack
											instance.Text = "0%"
											instance.TextSize = 13
											instance.TextColor3 = Color3.fromRGB(v82[14], 255, 255)
											instance.TextStrokeColor3 = Color3.fromRGB(v82[63], 0, v82[63])
											instance.TextStrokeTransparency = 0.3
											instance.TextXAlignment = Enum.TextXAlignment.Center
											instance.TextYAlignment = Enum.TextYAlignment.Center
											instance.ZIndex = v82[70]
											instance.Parent = frame
											local textLabel2 = Instance.new("TextLabel")
											textLabel2.Name = "StatsLabel"
											textLabel2.Position = UDim2.new(v82[103], -135, 0, 0)
											textLabel2.Size = UDim2.new(0, 120, 1, 0)
											textLabel2.BackgroundTransparency = 1
											textLabel2.Font = Enum.Font.MontserratBlack
											textLabel2.Text = "FPS:60  PING:45"
											textLabel2.TextSize = v82[172]
											textLabel2.TextColor3 = Color3.fromRGB(255, 255, v82[14])
											textLabel2.TextStrokeColor3 = Color3.fromRGB(v82[63], v82[63], 0)
											textLabel2.TextStrokeTransparency = v82[75]
											textLabel2.TextXAlignment = Enum.TextXAlignment.Right
											textLabel2.TextYAlignment = Enum.TextYAlignment.Center
											textLabel2.ZIndex = 5
											textLabel2.Parent = frame
											frame.Parent = screenGui
											v95 = screenGui
											v92 = frame
											v91 = frame2
											v90 = instance
											v94 = textLabel2
											fn50()

											pcall(function()
												fn53(frame, function(arg)
													tbl20.autoGrabBarPosition = { xScale = arg.X.Scale, xOffset = arg.X.Offset, yScale = arg.Y.Scale, yOffset = arg.Y.Offset }
													fn31()
												end)
											end)
										end
									end

									pcall(function()
										for _, child in ipairs(service4:GetChildren()) do
											if child.Name:find("^AutoGrabWorldMarker_") then
												pcall(function()
													child:Destroy()
												end)
											end
										end

										tbl25 = {}

										for i, v95 in ipairs(tbl26) do
											local part = Instance.new("Part")
											part.Name = "AutoGrabWorldMarker_" .. tostring(i)
											part.Size = Vector3.new(1, 1, 1)
											part.Position = v95
											part.Transparency = 1
											part.Anchored = v82[173]
											part.CanCollide = false
											part.CanTouch = false
											part.CanQuery = false
											part.Parent = service4
											local billboardGui = Instance.new("BillboardGui")
											billboardGui.Name = "CountdownGui"
											billboardGui.Adornee = part
											billboardGui.Size = UDim2.fromOffset(v82[86], v82[186])
											billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
											billboardGui.AlwaysOnTop = v82[173]
											billboardGui.MaxDistance = 1000
											billboardGui.ResetOnSpawn = v82[139]
											billboardGui.Parent = part
											local textLabel = Instance.new("TextLabel")
											textLabel.Name = "TimeLabel"
											textLabel.Size = UDim2.fromScale(v82[103], 1)
											textLabel.BackgroundTransparency = v82[103]
											textLabel.Text = "1.30s"
											textLabel.TextColor3 = Color3.fromRGB(v82[14], v82[14], 255)
											textLabel.TextStrokeColor3 = Color3.fromRGB(v82[63], 0, 0)
											textLabel.TextStrokeTransparency = 0.2
											textLabel.Font = Enum.Font.MontserratBlack
											textLabel.TextSize = 28
											textLabel.TextXAlignment = Enum.TextXAlignment.Center
											textLabel.TextYAlignment = Enum.TextYAlignment.Center
											textLabel.Parent = billboardGui
											table.insert(tbl25, textLabel)
										end
									end)
								end
							end

							do
								local connection, fn53

								do
									do
										do
											pcall(fn51)
											_G.HookAutoGrabBarGen = (tonumber(_G.HookAutoGrabBarGen) or 0) + v82[103]

											do
												local hookAutoGrabBarGen = _G.HookAutoGrabBarGen
												local n35 = 0

												service.RenderStepped:Connect(function()
													if hookAutoGrabBarGen ~= _G.HookAutoGrabBarGen then
														return
													end

													if tick() - n35 > 2 then
														n35 = tick()

														if not v92 or not v92.Parent then
															pcall(fn51)
														end

														fn50()
													end

													if #tbl25 == 0 and not v92 then
														return
													end
													local flag22 = tbl24.active and tbl24.startTime > v82[63]
													local autoGrabEnabled = tbl20.autoGrabEnabled

													if not autoGrabEnabled and _G.VampireStealModes and _G.VampireStealModes.State then
														autoGrabEnabled = _G.VampireStealModes.State.Enabled == true
													end

													local text, n36

													if autoGrabEnabled then
														if flag22 then
															local startTime = tbl24.startTime
															local n37 = tick() - startTime

															if tbl20.autoGrabVersion == v82[122] then
																if tbl24.phase == "waitingRange" then
																	text = "READY"
																	n36 = 0.2
																else
																	n36 = math.max(0, 1.3 - n37)
																	text = string.format("%.2fs", n36)
																end
															else
																n36 = math.max(0, 1.3 - n37)
																text = string.format("%.2fs", n36)
															end
														else
															text = string.format("%.2fs", 1.3)
															n36 = 1.3
														end
													else
														text = ""
														n36 = 1.3
													end

													n32 += v82[103]
													local now3 = tick()

													if now3 - now2 >= 0.4 then
														n33 = math.floor(n32 / (now3 - now2))
														n32 = 0
														now2 = now3
													end

													if now3 - v93 >= 1 then
														v93 = now3

														pcall(function()
															local Stats = game:GetService("Stats")
															Stats = Stats and Stats:FindFirstChild("Network")
															Stats = Stats and Stats:FindFirstChild("ServerStatsItem")
															Stats = Stats and Stats:FindFirstChild("Data Ping")

															if Stats then
																n34 = math.floor(Stats:GetValue())
															end
														end)
													end

													local v95 = fn52(n36, 1.3)
													local v96 = color

													if not color then
														v96 = ACCENT_MAP and ACCENT_MAP[tbl20.accentName]
													end

													if not v96 then
														Color3.fromRGB(v82[148], 32, v82[55])
													end

													local markerDisplayStyle = tbl20.markerDisplayStyle or "Both (Hitmarker + Bar)"
													local visible = autoGrabEnabled and (markerDisplayStyle == "Both (Hitmarker + Bar)" or markerDisplayStyle == "Hitmarker Only")
													autoGrabEnabled = autoGrabEnabled and (markerDisplayStyle == "Both (Hitmarker + Bar)" or markerDisplayStyle == "Bar Only")
													local n37 = 0

													if flag22 then
														if tbl24.progress and tbl24.progress > 0 then
															n37 = tbl24.progress
														else
															local startTime = tbl24.startTime
															local v97 = v82[63]
															n37 = math.clamp((tick() - startTime) / 1.3, v97, 1)
														end
													end

													for _, v97 in ipairs(tbl25) do
														if v97 and v97.Parent then
															v97.Visible = visible

															if visible then
																v97.Text = text
																v97.TextColor3 = v95
															end
														end
													end

													if v92 and v92.Parent then
														v92.Visible = autoGrabEnabled

														if autoGrabEnabled then
															if v91 then
																v91.Size = UDim2.new(n37, 0, v82[103], 0)
																local n38, n39, n40

																if n37 < 0.5 then
																	n38 = math.floor(60 + n37 * 2 * 105)
																	n39 = 255
																	n40 = 60
																else
																	local n41 = (n37 - 0.5) * 2
																	n39 = math.floor(v82[14] - n41 * 205)
																	n38 = math.floor(v82[142] + n41 * 55)
																	n40 = 60
																end

																v91.BackgroundColor3 = Color3.fromRGB(n39, n38, n40)
															end

															if v90 then
																v90.Text = string.format("%d%%", math.floor(n37 * 100))
															end

															if v94 then
																v94.Text = string.format("FPS:%d  PING:%d", n33, n34)
															end
														end
													end
												end)
											end
										end

										do
											local function fn54()
												local v95 = tbl20
												_G.HookStealGen = (tonumber(_G.HookStealGen) or v82[63]) + 1
												local hookStealGen = _G.HookStealGen
												local v96 = v83

												if _G.VampireStealModes and type(_G.VampireStealModes.Destroy) == "function" then
													pcall(_G.VampireStealModes.Destroy)
												end

												local tbl26 = {
													Enabled = false,
													Mode = "semi",
													Active = false,
													Phase = "idle",
													Progress = v82[63],
													LastResult = "",
													LastResultTime = 0,
													NormalRadius = 61,
													NormalDuration = 1.3,
													SemiRadius = 9,
													SemiPrimeRange = 80,
													SemiHoldMin = 1.3,
													SemiHoldMax = 2.6,
													SemiEntryDelay = 0.3,
													NormalV2StopAt = 75,
													NormalV2Wait = 1.5,
													TriggerRange = v82[146],
													PausedUntil = 0,
												}

												tbl26.SemiPrimeRange = tonumber(v95.primeRange) or 80
												tbl26.NormalRadius = tonumber(v95.primeRange) or 61
												local tbl27 = { V1 = "semi", V2 = "normal", V3 = "normalv2" }
												local n35 = 0.03

												if UserInputService and UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
													n35 = 0.06
												end

												local tbl28 = {}
												local obj = setmetatable({}, { __mode = "k" })
												local obj2 = setmetatable({}, { __mode = "k" })
												local tbl29 = {}
												local n36 = 0
												local n37 = 0
												local v97 = nil
												local n38 = 0
												local v98 = nil
												local flag22 = false
												local n39 = 0
												local flag23 = false

												local function fn55(arg)
													local v99 = tbl28[arg]

													if v99 then
														v99:Disconnect()
														tbl28[arg] = nil
													end
												end

												local function fn56()
													local character = v96.Character

													if character then
														character = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
													end

													return character
												end

												local function fn57(arg)
													local now3 = os.clock()
													local v99 = obj2[arg]
													if v99 and now3 - v99.Time < v82[122] then
														return v99.Value
													end
													local plotSign = arg and arg:FindFirstChild("PlotSign")
													plotSign = plotSign and plotSign:FindFirstChild("YourBase")
													local isBillboardGui = plotSign and plotSign:IsA("BillboardGui")
													local flag24 = false

													if isBillboardGui then
														flag24 = plotSign.Enabled == v82[173]
													end

													obj2[arg] = { Value = flag24, Time = now3 }
													return flag24
												end

												local function fn58(arg)
													local now3 = os.clock()
													if not arg and now3 - n36 < 0.15 and #tbl29 > v82[63] then
														return tbl29
													end
													tbl29 = {}
													n36 = now3
													local plots = workspace:FindFirstChild("Plots")
													if not plots then
														return tbl29
													end

													for _, child in ipairs(plots:GetChildren()) do
														if not fn57(child) then
															local animalPodiums = child:FindFirstChild("AnimalPodiums")

															if animalPodiums then
																for _, child2 in ipairs(animalPodiums:GetChildren()) do
																	local base = child2:FindFirstChild("Base")
																	base = base and base:FindFirstChild("Spawn")
																	local promptAttachment = base and base:FindFirstChild("PromptAttachment")

																	if base and base:IsA("BasePart") and promptAttachment then
																		for _, child3 in ipairs(promptAttachment:GetChildren()) do
																			if child3:IsA("ProximityPrompt") then
																				table.insert(tbl29, { Prompt = child3, Spawn = base, Podium = child2, Plot = child })
																				break
																			end
																		end
																	end
																end
															end
														end
													end

													return tbl29
												end

												local function fn59(arg)
													local v99 = fn56()
													if not (v99 and arg and arg.Spawn and arg.Spawn.Parent) then
														return math.huge
													end
													return (v99.Position - arg.Spawn.Position).Magnitude
												end

												local function fn60(arg)
													local v99 = fn56()
													if not v99 then
														return nil
													end
													local huge = math.huge
													local v100 = nil

													for _, v101 in ipairs(fn58(false)) do
														if v101.Prompt.Parent and v101.Spawn.Parent then
															local magnitude = (v99.Position - v101.Spawn.Position).Magnitude

															if magnitude <= arg and magnitude < huge then
																huge = magnitude
																v100 = v101
															end
														end
													end

													return v100
												end

												local function fn61(arg)
													local v99 = obj[arg]
													if v99 then
														return v99
													end
													local tbl30 = { Hold = {}, Trigger = {}, Ready = true, Fallback = true }

													if getconnections then
														tbl30.Fallback = not pcall(function()
															for _, v100 in ipairs(getconnections(arg.PromptButtonHoldBegan)) do
																if type(v100.Function) == "function" then
																	table.insert(tbl30.Hold, v100.Function)
																end
															end

															for _, v100 in ipairs(getconnections(arg.Triggered)) do
																if type(v100.Function) == "function" then
																	local function_ = v100.Function
																	local flag24 = false

																	for _, v101 in ipairs(tbl30.Hold) do
																		if v101 == function_ then
																			flag24 = v82[173]
																			break
																		end
																	end

																	if not flag24 then
																		table.insert(tbl30.Trigger, function_)
																	end
																end
															end
														end) or #tbl30.Hold == 0 and #tbl30.Trigger == v82[63]
													end

													obj[arg] = tbl30
													return tbl30
												end

												local function fn62(arg)
													for _, v99 in ipairs(arg) do
														task.spawn(function()
															pcall(v99)
														end)
													end
												end

												local function fn63(arg, arg2)
													return (pcall(function()
														if arg2.Fallback then
															arg:InputHoldBegin()
															v98 = arg
															flag22 = true
														else
															fn62(arg2.Hold)
														end
													end))
												end

												local function fn64(arg, arg2)
													local ok = pcall(function()
														if arg2.Fallback then
															arg:InputHoldEnd()
															v98 = nil
															flag22 = v82[139]
														else
															fn62(arg2.Trigger)
														end
													end)

													if not ok and fireproximityprompt then
														ok = pcall(fireproximityprompt, arg)
													end

													return ok
												end

												local function fn65()
													if v98 and flag22 and v98.Parent then
														pcall(function()
															v98:InputHoldEnd()
														end)
													end

													v98 = nil
													flag22 = v82[139]
												end

												local function fn66(arg, phase)
													tbl26.Progress = math.clamp(arg or v82[63], v82[63], v82[103])

													if phase then
														tbl26.Phase = phase
													end

													tbl24.progress = tbl26.Progress
													tbl24.phase = tbl26.Phase
													tbl24.active = tbl26.Active
												end

												local function fn67(arg, lastResult)
													arg.Ready = true
													tbl26.Active = false
													tbl26.Phase = "idle"
													tbl26.LastResult = lastResult or ""
													tbl26.LastResultTime = os.clock()
													fn66(0)
													tbl24.active = false
													tbl24.phase = "idle"
													tbl24.progress = v82[63]
													tbl24.lastResult = lastResult or ""
												end

												local function fn68(arg, arg2)
													return tbl26.Enabled and n39 == arg and arg2 and arg2.Parent
												end

												local function fn69(arg)
													local prompt = arg and arg.Prompt
													if not prompt or not prompt.Parent or tbl26.Active then
														return
													end
													local now3 = os.clock()
													if now3 < tbl26.PausedUntil or now3 - n37 < 0.1 then
														return
													end
													local v99 = fn61(prompt)
													if not v99.Ready then
														return
													end
													v99.Ready = false
													tbl26.Active = true
													tbl26.Phase = "holding"
													n37 = now3
													local v100 = n39
													tbl24.active = true
													tbl24.startTime = tick()
													tbl24.phase = "holding"
													tbl24.progress = v82[63]
													tbl24.label = arg.Prompt and arg.Prompt.Parent and arg.Prompt.Parent.Parent and arg.Prompt.Parent.Parent.Name or "Animal"

													task.spawn(function()
														if not fn63(prompt, v99) then
															fn67(v99, "Hold failed")
															return
														end
														local now4 = os.clock()
														local n40 = math.max(tbl26.NormalDuration, 0.01)

														while fn68(v100, prompt) and os.clock() - now4 < n40 do
															fn66((os.clock() - now4) / n40, "holding")
															service.Heartbeat:Wait()
														end

														if not fn68(v100, prompt) then
															fn65()
															fn67(v99, "Cancelled")
															return
														end

														local v101 = fn64(prompt, v99)

														if v101 then
															fn66(1, "done")
															task.wait(math.max(n40 * 0.08, 0.08))
														end

														fn67(v99, v101 and "Stole" or "Failed")
													end)
												end

												local function fn70(arg)
													local prompt = arg and arg.Prompt
													local now3 = os.clock()
													if not prompt or not prompt.Parent or tbl26.Active or now3 < tbl26.PausedUntil then
														return
													end

													if now3 - n37 < 0.1 then
														return
													end

													if prompt == v97 and now3 - n38 < 1.5 then
														return
													end
													local v99 = fn61(prompt)
													if not v99.Ready then
														return
													end
													v99.Ready = false
													tbl26.Active = true
													tbl26.Phase = "holding"
													local v100 = n39
													tbl24.active = true
													tbl24.startTime = tick()
													tbl24.phase = "holding"
													tbl24.progress = 0
													tbl24.label = arg.Prompt and arg.Prompt.Parent and arg.Prompt.Parent.Parent and arg.Prompt.Parent.Parent.Name or "Animal"

													task.spawn(function()
														if not fn63(prompt, v99) then
															fn67(v99, "Hold failed")
															return
														end
														local now4 = os.clock()
														local semiRadius = tbl26.SemiRadius
														local flag24 = fn59(arg) <= semiRadius

														while true do
															local flag25 = fn68(v100, prompt)

															if flag25 then
																local semiHoldMin = tbl26.SemiHoldMin
																flag25 = os.clock() - now4 < semiHoldMin
															end

															if flag25 then
																local semiHoldMax = tbl26.SemiHoldMax
																fn66((os.clock() - now4) / semiHoldMax, "holding")
																service.Heartbeat:Wait()
																continue
															end

															break
														end

														tbl26.Phase = "waitingRange"
														tbl24.phase = "waitingRange"
														local v101 = v82[139]

														while true do
															local flag25 = fn68(v100, prompt)

															if flag25 then
																local semiHoldMax = tbl26.SemiHoldMax
																flag25 = os.clock() - now4 <= semiHoldMax
															end

															if flag25 then
																local semiHoldMax = tbl26.SemiHoldMax
																fn66((os.clock() - now4) / semiHoldMax, "waitingRange")
																local semiRadius2 = tbl26.SemiRadius

																if fn59(arg) <= semiRadius2 then
																	if not flag24 then
																		task.wait(tbl26.SemiEntryDelay)
																	end

																	if fn68(v100, prompt) then
																		v101 = fn64(prompt, v99)
																	end

																	break
																else
																	service.Heartbeat:Wait()
																	continue
																end
															end

															break
														end

														if not v101 then
															fn65()
														end

														if v101 then
															fn66(1, "done")
														end

														task.wait(0.05)

														if v101 then
															local v102 = prompt
															local now5 = os.clock()
															v97 = v102
															n38 = now5
															n37 = os.clock()
														end

														fn67(v99, v101 and "Stole" or "Missed window")
													end)
												end

												local function fn71(arg)
													local prompt = arg and arg.Prompt
													if not prompt or not prompt.Parent or tbl26.Active then
														return
													end
													local now3 = os.clock()
													if now3 < tbl26.PausedUntil or now3 - n37 < 0.1 then
														return
													end
													local v99 = fn61(prompt)
													if not v99.Ready then
														return
													end
													v99.Ready = v82[139]
													tbl26.Active = true
													tbl26.Phase = "holding"
													n37 = now3
													local v100 = n39
													tbl24.active = true
													tbl24.startTime = tick()
													tbl24.phase = "holding"
													tbl24.progress = 0
													tbl24.label = arg.Prompt and arg.Prompt.Parent and arg.Prompt.Parent.Parent and arg.Prompt.Parent.Parent.Name or "Animal"

													task.spawn(function()
														if not fn63(prompt, v99) then
															fn67(v99, "Hold failed")
															return
														end
														local n40 = math.max(tbl26.NormalDuration, 0.01)
														local n41 = math.clamp(tbl26.NormalV2StopAt / v82[106], 0.75, 0.9)
														local n42 = n40 * n41
														local n43 = n40 * (v82[103] - n41)
														local now4 = os.clock()

														while fn68(v100, prompt) and os.clock() - now4 < n42 do
															fn66(math.clamp((os.clock() - now4) / n40, 0, n41), "holding")
															service.Heartbeat:Wait()
														end

														fn66(n41, "waitingRange")
														local now5 = os.clock()

														while true do
															local flag24 = fn68(v100, prompt)

															if flag24 then
																local triggerRange = tbl26.TriggerRange
																flag24 = fn59(arg) > triggerRange
															end

															if flag24 then
																local normalV2Wait = tbl26.NormalV2Wait
																flag24 = os.clock() - now5 < normalV2Wait
															end

															if flag24 then
																service.Heartbeat:Wait()
																continue
															end
															break
														end

														if not fn68(v100, prompt) then
															fn65()
															fn67(v99, "Cancelled")
															return
														end

														local now6 = os.clock()

														while fn68(v100, prompt) and os.clock() - now6 < n43 do
															fn66(math.clamp(n41 + (os.clock() - now6) / n40, n41, 1), "finishing")
															service.Heartbeat:Wait()
														end

														local v101 = fn68(v100, prompt) and fn64(prompt, v99)

														if not v101 then
															fn65()
														end

														if v101 then
															fn66(1, "done")
															task.wait(math.max(n40 * 0.08, 0.08))
														end

														fn67(v99, v101 and "Stole" or "Failed")
													end)
												end

												local function fn72()
													if n27(3196) > 7710 then
														if hookStealGen ~= _G.HookStealGen then
															fn55("Scan")
															return
														end
														local active = not tbl26.Enabled or tbl26.Active

														if not active then
															local pausedUntil = tbl26.PausedUntil
															active = os.clock() < pausedUntil
														end

														if active then
															return
														end

														if tbl26.Mode == "semi" then
															local v99 = fn60(tbl26.SemiPrimeRange)

															if v99 then
																fn70(v99)
															end
														elseif tbl26.Mode == "normalv2" then
															local v99 = fn60(tbl26.NormalRadius)

															if v99 then
																fn71(v99)
															end
														else
															local v99 = fn60(tbl26.NormalRadius)

															if v99 then
																fn69(v99)
															end
														end

														return
													end

													while true do
													end
												end

												local vampireStealModes

												vampireStealModes = {
													State = tbl26,
													Start = function()
														if 13862 >= n27(3098) then
															if flag23 then
																return
															end
															tbl26.Enabled = true

															if not tbl28.Scan then
																local v99 = v82[63]

																tbl28.Scan = service.Heartbeat:Connect(function(deltaTime)
																	v99 += deltaTime or 0
																	if v99 < n35 then
																		return
																	end
																	v99 = v82[63]
																	fn72()
																end)
															end

															return
														end

														while true do
														end
													end,
													Stop = function()
														tbl26.Enabled = v82[139]
														n39 += 1
														fn55("Scan")
														fn65()
														tbl26.Active = v82[139]
														tbl26.Phase = "idle"
														tbl26.Progress = v82[63]

														for _, v99 in pairs(obj) do
															v99.Ready = true
														end
													end,
													SetMode = function(arg)
														local mode = tostring(arg):lower():gsub("%s+", "")

														if mode == "normalv2" or mode == "normal2" or mode == "v2" then
															mode = "normalv2"
														end

														if mode ~= "normal" and mode ~= "semi" and mode ~= "normalv2" then
															return false
														end
														local enabled = tbl26.Enabled
														vampireStealModes.Stop()
														tbl26.Mode = mode

														if enabled then
															vampireStealModes.Start()
														end

														return true
													end,
													SetNormalRadius = function(arg)
														local num = tonumber(arg)

														if num then
															tbl26.NormalRadius = math.clamp(math.floor(num + 0.5), 5, 300)
														end
													end,
													SetNormalDuration = function(arg)
														local num = tonumber(arg)

														if num then
															tbl26.NormalDuration = math.clamp(num, 0.01, 5)
														end
													end,
													SetSemiRadius = function(arg)
														local num = tonumber(arg)

														if num then
															tbl26.SemiRadius = math.clamp(num, 1, 300)
														end
													end,
													SetNormalV2StopAt = function(arg)
														local normalV2StopAt = tonumber(arg)

														if normalV2StopAt == 75 or normalV2StopAt == v82[42] or normalV2StopAt == 85 or normalV2StopAt == 90 then
															tbl26.NormalV2StopAt = normalV2StopAt
														end
													end,
													Pause = function(arg)
														tbl26.PausedUntil = os.clock() + math.max(tonumber(arg) or 0, v82[63])
													end,
													Destroy = function()
														if flag23 then
															return
														end
														vampireStealModes.Stop()
														flag23 = true

														if _G.VampireStealModes == vampireStealModes then
															_G.VampireStealModes = nil
														end
													end,
												}

												_G.VampireStealModes = vampireStealModes

												local function cancelAndRecoverAutoGrab()
													vampireStealModes.Stop()

													for _, v99 in pairs(obj) do
														local v100 = v82[72]

														if type(v99) == v100 then
															v99.Ready = true
														end
													end

													tbl29 = {}
													n36 = 0

													if tbl26.autoGrabEnabled then
														task.defer(vampireStealModes.Start)
													end
												end

												tbl26.cancelAndRecoverAutoGrab = cancelAndRecoverAutoGrab

												tbl26._cancelAutoGrabInFlight = function()
													cancelAndRecoverAutoGrab("ManualCancel")
												end

												v95.cancelAndRecoverAutoGrab = cancelAndRecoverAutoGrab
												v95._cancelAutoGrabInFlight = tbl26._cancelAutoGrabInFlight

												fn39 = function(autoGrabEnabled)
													tbl26.autoGrabEnabled = autoGrabEnabled
													v95.autoGrabEnabled = autoGrabEnabled
													tbl26.SemiPrimeRange = tonumber(v95.primeRange) or tbl26.SemiPrimeRange
													tbl26.NormalRadius = tonumber(v95.primeRange) or tbl26.NormalRadius

													if v86 and v86.setState then
														pcall(function()
															v86.setState(autoGrabEnabled)
														end)
													end

													local setState = nil

													if v89 then
														setState = v89.setState
													end

													if setState then
														pcall(function()
															v89.setState(autoGrabEnabled)
														end)
													end

													if autoGrabEnabled then
														vampireStealModes.SetMode(tbl27[v95.autoGrabMode] or "semi")
														vampireStealModes.Start()
													else
														vampireStealModes.Stop()
													end

													fn31()
												end

												v83.CharacterAdded:Connect(function()
													cancelAndRecoverAutoGrab("Respawn")

													if tbl26.autoGrabEnabled then
														task.delay(0.3, vampireStealModes.Start)
													end
												end)
											end

											fn54()
										end

										do
											local now3 = v82[63]

											fn40 = function(arg, arg2, arg3)
												if tpDownRunning then
													return
												end
												tpDownRunning = true

												pcall(function()
													local character = v83.Character
													local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
													local humanoid = character and character:FindFirstChildOfClass("Humanoid")
													if not humanoidRootPart or not humanoid then
														return
													end
													local position = humanoidRootPart.Position

													if position.X ~= position.X or position.Y ~= position.Y or position.Z ~= position.Z or math.abs(position.X) > 1000000 or math.abs(position.Y) > 1000000 or math.abs(position.Z) > 1000000 then
														if tick() - now3 > 5 then
															now3 = tick()

															pcall(function()
																v83:LoadCharacter()
															end)
														end

														return
													end

													pcall(function()
														service4.FallenPartsDestroyHeight = -50000
														humanoid.BreakJointsOnDeath = false
														humanoid.RequiresNeck = false
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, v82[139])
														humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
													end)

													pcall(function()
														if stopNamed then
															stopNamed(humanoidRootPart, "InfJump")
														end
													end)

													pcall(function()
														local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

														if torso then
															torso.CanCollide = true
														end

														local lowerTorso = character:FindFirstChild("LowerTorso")

														if lowerTorso then
															lowerTorso.CanCollide = v82[173]
														end
													end)

													local x = arg2 or humanoidRootPart.Position.X
													local z = arg3 or humanoidRootPart.Position.Z
													local raycastParams = RaycastParams.new()
													raycastParams.FilterType = Enum.RaycastFilterType.Exclude
													raycastParams.IgnoreWater = true
													local filterDescendantsInstances = { character }

													for _, player in ipairs(service2:GetPlayers()) do
														if player ~= v83 and player.Character then
															table.insert(filterDescendantsInstances, player.Character)
														end
													end

													raycastParams.FilterDescendantsInstances = filterDescendantsInstances
													local vector = Vector3.new(x, humanoidRootPart.Position.Y, z)
													local y = nil

													for i = 1, 15 do
														local hit = service4:Raycast(vector, Vector3.new(0, -3000, 0), raycastParams)
														y = nil

														if hit then
															local instance = hit.Instance
															local parent = instance
															local v95 = nil

															for i2 = v82[103], 6 do
																local flag22 = not parent or parent == service4
																v95 = nil

																if not flag22 then
																	if parent:IsA("Model") and parent:FindFirstChildOfClass("Humanoid") then
																		v95 = parent
																		break
																	else
																		parent = parent.Parent
																		v95 = nil
																		continue
																	end
																end

																break
															end

															if instance.Transparency >= 0.9 or instance.CanCollide == v82[139] or v95 then
																table.insert(filterDescendantsInstances, v95 or instance)
																raycastParams.FilterDescendantsInstances = filterDescendantsInstances
																vector = hit.Position - Vector3.new(0, 0.2, 0)
																y = nil
																continue
															else
																y = hit.Position.Y
																break
															end
														end

														break
													end

													if not y then
														return
													end
													local n35 = y + 2.8
													local x2 = humanoidRootPart.AssemblyLinearVelocity.X
													local z2 = humanoidRootPart.AssemblyLinearVelocity.Z

													if x2 ~= x2 then
														x2 = v82[63]
													end

													if z2 ~= z2 then
														z2 = v82[63]
													end

													local ok, result = pcall(fn48)
													local n36 = math.max(ok and result or 60, v82[186])
													local v95 = math.sqrt(x2 * x2 + z2 * z2)

													if v95 > n36 and v95 > 0 then
														x2 = x2 / v95 * n36
														z2 = z2 / v95 * n36
													end

													humanoidRootPart.CFrame = CFrame.new(x, n35, z)
													humanoidRootPart.AssemblyLinearVelocity = Vector3.new(x2, 0, z2)
													humanoidRootPart.AssemblyAngularVelocity = Vector3.zero

													pcall(function()
														humanoidRootPart.Velocity = Vector3.new(x2, 0, z2)
														humanoidRootPart.RotVelocity = Vector3.zero
													end)

													pcall(function()
														humanoid.PlatformStand = v82[139]
														humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

														if not tbl20.antiDieEnabled then
															humanoid.BreakJointsOnDeath = true
															humanoid.RequiresNeck = true
															humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
														end
													end)
												end)

												tpDownRunning = false
											end
										end
									end

									do
										local connection2, fn54

										do
											connection2 = nil

											do
												local n35 = 0

												fn54 = function()
													if connection2 then
														return
													end

													connection2 = service.Heartbeat:Connect(function()
														if not tbl20.autoTpDown or flag21 or flag20 then
															return
														end
														local character = v83.Character
														local humanoid = character and character:FindFirstChildOfClass("Humanoid")
														local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
														if not character or not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
															return
														end
														local now3 = tick()
														if now3 - n35 < 0.08 then
															return
														end
														local flag22 = not (humanoidRootPart.AssemblyLinearVelocity.Y < -2 or humanoidRootPart.Velocity and humanoidRootPart.Velocity.Y < -2)

														if flag22 then
															local freefall = Enum.HumanoidStateType.Freefall
															flag22 = humanoid:GetState() ~= freefall
														end

														if flag22 then
															return
														end
														local raycastParams = RaycastParams.new()
														raycastParams.FilterType = Enum.RaycastFilterType.Exclude
														raycastParams.IgnoreWater = v82[173]
														raycastParams.FilterDescendantsInstances = { character }
														local hit = service4:Raycast(humanoidRootPart.Position, Vector3.new(0, -3000, 0), raycastParams)

														if hit then
															local n36 = humanoidRootPart.Position.Y - hit.Position.Y - v82[171]
															local autoTpDownHeight = tbl20.autoTpDownHeight or 15
															local flag23 = humanoid.FloorMaterial == Enum.Material.Air
															local flag24

															if flag23 then
																flag24 = flag23
															else
																local freefall = Enum.HumanoidStateType.Freefall
																flag24 = humanoid:GetState() == freefall
															end

															if flag24 and n36 >= autoTpDownHeight then
																n35 = now3
																fn40(false)
															end
														end
													end)
												end
											end
										end

										do
											local function fn55()
												if connection2 then
													connection2:Disconnect()
													connection2 = nil
												end
											end

											fn47 = function(autoTpDown)
												tbl20.autoTpDown = autoTpDown

												if autoTpDown then
													fn54()
												else
													fn55()
												end

												fn31()
											end
										end
									end

									tbl20._circleTrack = {
										conn = nil,
										target = nil,
										lastPos = nil,
										velocity = Vector3.zero,
									}

									do
										local function fn54()
											local character = v83.Character
											if not character then
												return nil
											end
											local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
											if not humanoidRootPart then
												return nil
											end
											local position = humanoidRootPart.Position
											local huge = math.huge
											local v95 = nil

											for _, player in ipairs(service2:GetPlayers()) do
												if player ~= v83 and player.Character then
													local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
													local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

													if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
														local magnitude = (position - humanoidRootPart2.Position).Magnitude

														if magnitude < huge then
															huge = magnitude
															v95 = player
														end
													end
												end
											end

											return v95, huge
										end

										connection = nil
										local v95 = v82[63]

										local function fn55(arg)
											if not arg then
												return
											end
											local now3 = tick()
											if now3 - v95 < 0.12 then
												return
											end

											for _, child in ipairs(arg:GetChildren()) do
												if child:IsA("Tool") and child.Name:lower():find("bat", v82[103], v82[173]) then
													pcall(function()
														child:Activate()
													end)

													v95 = now3
												end
											end
										end

										fn53 = function()
											if connection then
												return
											end
											local n35 = 0

											connection = service.Heartbeat:Connect(function(deltaTime)
												n35 += deltaTime
												if n35 < 0.05 then
													return
												end
												n35 = 0
												if not tbl20.autoHitEnabled then
													return
												end
												local character = v83.Character
												local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
												if not humanoidRootPart then
													return
												end
												local v96 = fn54()
												local humanoidRootPart2 = v96 and v96.Character and v96.Character:FindFirstChild("HumanoidRootPart")

												if humanoidRootPart2 and (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= v82[24] then
													fn55(character)
												end
											end)
										end
									end
								end

								do
									do
										do
											local function fn54()
												if connection then
													connection:Disconnect()
													connection = nil
												end
											end

											tbl20._setAutoHit = function(autoHitEnabled)
												tbl20.autoHitEnabled = autoHitEnabled

												if autoHitEnabled then
													fn53()
												else
													fn54()
												end

												fn31()
											end
										end
									end

									do
										local fn54, fn55

										do
											do
												local function fn56(arg)
													if not arg or not arg:IsA("Tool") then
														return v82[139]
													end
													local str8 = arg.Name:lower()
													return str8:find("bat", 1, v82[173]) ~= nil or str8:find("slap", 1, true) ~= nil or str8:find("club", 1, true) ~= nil or str8:find("hammer", 1, true) ~= nil
												end

												fn54 = function(arg)
													if not arg or not arg:IsA("Tool") then
														return
													end

													pcall(function()
														arg.Enabled = true

														for _, descendant in ipairs(arg:GetDescendants()) do
															if descendant:IsA("BasePart") then
																descendant.CanCollide = v82[139]
															end
														end
													end)

													pcall(function()
														arg.Equipped:Connect(function()
															pcall(function()
																for _, descendant in ipairs(arg:GetDescendants()) do
																	if descendant:IsA("BasePart") then
																		descendant.CanCollide = false
																	end
																end
															end)
														end)
													end)
												end

												fn55 = function()
													local character = v83.Character
													if not character then
														return nil
													end
													local humanoid = character:FindFirstChildOfClass("Humanoid")
													if not humanoid or humanoid.Health <= 0 then
														return nil
													end

													for _, child in ipairs(character:GetChildren()) do
														if fn56(child) then
															return child
														end
													end

													local backpack = v83:FindFirstChildOfClass("Backpack") or v83:FindFirstChild("Backpack")

													if backpack then
														for _, child in ipairs(backpack:GetChildren()) do
															if fn56(child) then
																pcall(function()
																	humanoid:EquipTool(child)
																end)

																return child
															end
														end
													end

													return nil
												end
											end
										end

										do
											local function fn56(arg)
												local backpack = v83:FindFirstChildOfClass("Backpack") or v83:FindFirstChild("Backpack")

												if backpack then
													for _, child in ipairs(backpack:GetChildren()) do
														if child:IsA("Tool") then
															fn54(child)
														end
													end

													backpack.ChildAdded:Connect(function(child)
														if child:IsA("Tool") then
															task.wait(0.05)
															fn54(child)
														end
													end)
												end

												if arg then
													for _, child in ipairs(arg:GetChildren()) do
														if child:IsA("Tool") then
															fn54(child)
														end
													end

													arg.ChildAdded:Connect(function(child)
														if child:IsA("Tool") then
															task.wait(0.05)
															fn54(child)
														end
													end)
												end
											end

											v83.CharacterAdded:Connect(function(character)
												task.wait(0.05)

												pcall(function()
													fn56(character)
												end)

												if tbl20.autoEquipBat then
													task.delay(0.2, function()
														pcall(fn55)
													end)
												end
											end)

											if v83.Character then
												task.spawn(fn56, v83.Character)
											end
										end
									end
								end
							end

							local fn53

							do
								do
									local function fn54()
										local character = v83.Character
										if not character then
											return nil
										end
										local humanoid = character:FindFirstChildOfClass("Humanoid")
										local tool = character:FindFirstChildOfClass("Tool")
										if tool then
											return tool
										end

										for _, child in ipairs(character:GetChildren()) do
											if child:IsA("Tool") then
												return child
											end
										end

										local backpack = v83:FindFirstChild("Backpack")

										if backpack then
											for _, child in ipairs(backpack:GetChildren()) do
												if child:IsA("Tool") then
													local str8 = child.Name:lower()

													if str8:find("bat") or str8:find("slap") or str8:find("sword") or str8:find("blade") or str8:find("hit") or str8:find("club") then
														if humanoid then
															pcall(function()
																humanoid:EquipTool(child)
															end)
														end

														return child
													end
												end
											end

											local tool2 = backpack:FindFirstChildOfClass("Tool")

											if tool2 then
												if humanoid then
													pcall(function()
														humanoid:EquipTool(tool2)
													end)
												end

												return tool2
											end
										end

										return nil
									end

									local function fn55()
										local humanoidRootPart = v83.Character and v83.Character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return nil
										end
										local huge = math.huge
										local v95 = nil

										for _, player in ipairs(service2:GetPlayers()) do
											if player ~= v83 and player.Character then
												local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
												local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

												if humanoidRootPart2 and humanoid and humanoid.Health > v82[63] then
													local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

													if magnitude < huge then
														huge = magnitude
														v95 = humanoidRootPart2
													end
												end
											end
										end

										return v95
									end

									fn53 = function()
										tbl20._circleTrack = tbl20._circleTrack or { conn = nil, target = nil, lastPos = nil, velocity = Vector3.zero }
										local circleTrack = tbl20._circleTrack

										if circleTrack.conn then
											circleTrack.conn:Disconnect()
											circleTrack.conn = nil
										end

										circleTrack.target = nil
										circleTrack.lastPos = nil
										circleTrack.velocity = Vector3.zero
										local character = v83.Character
										if not character then
											return
										end
										local humanoid = character:FindFirstChildOfClass("Humanoid")
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										if not humanoid or not humanoidRootPart then
											return
										end
										humanoid.AutoRotate = v82[139]
										local v95 = v82[63]

										circleTrack.conn = service.RenderStepped:Connect(function()
											if not tbl20.circleEnabled then
												if circleTrack.conn then
													circleTrack.conn:Disconnect()
													circleTrack.conn = nil
												end

												return
											end

											local character2 = v83.Character
											if not character2 then
												return
											end
											local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
											if not humanoidRootPart2 then
												return
											end
											local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
											if not humanoid2 or humanoid2.Health <= 0 then
												return
											end

											if not character2:FindFirstChildOfClass("Tool") then
												local v96 = fn54()

												if v96 then
													pcall(function()
														humanoid2:EquipTool(v96)
													end)
												end
											end

											local v96 = fn55()

											if not v96 then
												pcall(function()
													humanoidRootPart2.AssemblyLinearVelocity = Vector3.new(0, humanoidRootPart2.AssemblyLinearVelocity.Y * 0.5, 0)
													humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
												end)

												return
											end

											local assemblyLinearVelocity = v96.AssemblyLinearVelocity
											local position = humanoidRootPart2.Position
											local position2 = v96.Position
											local laggerCarrySpeed = tbl20.laggerCarryEnabled and (tbl20.laggerCarrySpeed or 40) or 58
											local n35 = position2 + assemblyLinearVelocity * 0.12 - position
											local vector = Vector3.new(n35.X, 0, n35.Z)
											local unit = vector.Magnitude > v82[51] and vector.Unit or Vector3.new(humanoidRootPart2.CFrame.LookVector.X, 0, humanoidRootPart2.CFrame.LookVector.Z)
											local vector2

											if unit.Magnitude < 0.01 then
												vector2 = Vector3.new(0, v82[63], -1)
											else
												vector2 = unit.Unit
											end

											local n36 = (position2.Y + 2.2 - position.Y) * 22 + assemblyLinearVelocity.Y * 0.55
											local n37

											if humanoid2.FloorMaterial == Enum.Material.Air then
												n37 = n36
											else
												n37 = math.max(n36, 8)
											end

											humanoidRootPart2.AssemblyLinearVelocity = Vector3.new(vector2.X * laggerCarrySpeed, math.clamp(n37, -v82[42], v82[109]), vector2.Z * laggerCarrySpeed)

											pcall(function()
												local enabled = nil

												if v84 then
													enabled = v84.Enabled
												end

												if enabled then
													v84.PlaneVelocity = Vector2.zero
													v84.Enabled = false
												end
											end)

											local n38 = position2 + assemblyLinearVelocity * math.clamp(assemblyLinearVelocity.Magnitude / 150, 0.05, 0.2)

											if (n38 - position).Magnitude > 0.1 then
												local cframe = CFrame.lookAt(position, n38)
												local v97, v98, v99 = (humanoidRootPart2.CFrame:Inverse() * cframe):ToEulerAnglesXYZ()
												humanoidRootPart2.AssemblyAngularVelocity = humanoidRootPart2.CFrame:VectorToWorldSpace(Vector3.new(math.clamp(v97, -2.5, 2.5) * 42, math.clamp(v98, -2.5, 2.5) * 42, math.clamp(v99, -2.5, 2.5) * 42))
											end

											if (position2 - position).Magnitude <= v82[112] then
												local now3 = tick()

												if now3 - v95 >= 0.12 then
													v95 = now3
													local tool = character2:FindFirstChildOfClass("Tool")

													if tool then
														local remoteEvent = tool:FindFirstChildOfClass("RemoteEvent") or tool:FindFirstChildOfClass("RemoteFunction")

														if remoteEvent and remoteEvent:IsA("RemoteEvent") then
															pcall(function()
																remoteEvent:FireServer()
															end)
														else
															pcall(function()
																tool:Activate()
															end)
														end
													end
												end
											end
										end)
									end
								end
							end

							do
								local function fn54()
									tbl20._circleTrack = tbl20._circleTrack or { conn = nil, target = nil, lastPos = nil, velocity = Vector3.zero }
									local circleTrack = tbl20._circleTrack

									if circleTrack.conn then
										circleTrack.conn:Disconnect()
										circleTrack.conn = nil
									end

									local character = v83.Character

									if character then
										local humanoid = character:FindFirstChildOfClass("Humanoid")

										if humanoid then
											humanoid.AutoRotate = v82[173]

											pcall(function()
												humanoid:Move(Vector3.zero, false)
											end)
										end

										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart then
											humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
											humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
										end
									end

									if v84 then
										v84.PlaneVelocity = Vector2.zero
										v84.Enabled = v82[139]
									end

									circleTrack.target = nil
									circleTrack.lastPos = nil
									circleTrack.velocity = Vector3.zero
								end

								fn32 = function(circleEnabled)
									if flag20 and circleEnabled then
										return
									end

									if circleEnabled and tbl23.active then
										fn49()
									end

									tbl20.circleEnabled = circleEnabled
									local setState = nil

									if v88 then
										setState = v88.setState
									end

									if setState then
										pcall(function()
											v88.setState(circleEnabled)
										end)
									end

									if v87 and v87.setState then
										pcall(function()
											v87.setState(circleEnabled)
										end)
									end

									if circleEnabled then
										fn53()
									else
										fn54()
									end

									fn31()
								end
							end
						end

						local fn48, fn49, fn50, fn51, fn52, fn53, tbl24, fn54, fn55, fn56

						do
							do
								do
									do
										local tbl25, connection, fn57

										do
											local fn58

											do
												tbl25 = {}

												do
													local function fn59(arg, cameraSubject, arg2)
														pcall(function()
															cameraSubject:ChangeState(Enum.HumanoidStateType.GettingUp)
															cameraSubject:ChangeState(Enum.HumanoidStateType.Running)

															for _, descendant in ipairs(arg:GetDescendants()) do
																if descendant:IsA("Motor6D") then
																	descendant.Enabled = v82[173]
																end

																if descendant:IsA("Constraint") then
																	descendant.Enabled = true
																end
															end

															arg2.Velocity = Vector3.zero
															arg2.RotVelocity = Vector3.zero
															arg2.AssemblyLinearVelocity = Vector3.zero
															arg2.AssemblyAngularVelocity = Vector3.zero

															if workspace.CurrentCamera then
																workspace.CurrentCamera.CameraSubject = cameraSubject
															end

															local playerModule = v83.PlayerScripts:FindFirstChild("PlayerModule")

															if playerModule then
																local ControlModule = require(playerModule:FindFirstChild("ControlModule"))

																if ControlModule then
																	ControlModule:Enable()
																end
															end

															cameraSubject.AutoRotate = true
															cameraSubject.PlatformStand = false
															cameraSubject.Sit = false
														end)

														if tbl20.cancelAndRecoverAutoGrab then
															pcall(function()
																tbl20.cancelAndRecoverAutoGrab("AntiRagdoll")
															end)
														end
													end

													fn58 = function(arg)
														for _, v88 in ipairs(tbl25) do
															pcall(function()
																v88:Disconnect()
															end)
														end

														tbl25 = {}
														if not arg then
															return
														end
														local humanoid = arg:WaitForChild("Humanoid", 5)
														local humanoidRootPart = arg:WaitForChild("HumanoidRootPart", 5)
														if not humanoid or not humanoidRootPart then
															return
														end

														local connection2 = service.Heartbeat:Connect(function()
															if not tbl20.antiRagdollEnabled then
																return
															end

															if humanoid.Health <= v82[63] then
																if n28(2421) < 1335 then
																	return
																end

																while v82[173] do
																end
															end

															local state = humanoid:GetState()

															if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or humanoid.PlatformStand == true then
																fn59(arg, humanoid, humanoidRootPart)
															end
														end)

														table.insert(tbl25, connection2)

														local connection3 = humanoid.StateChanged:Connect(function(old, new)
															if not tbl20.antiRagdollEnabled then
																return
															end

															if humanoid.Health <= 0 then
																return
															end

															if new == Enum.HumanoidStateType.Physics or new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.FallingDown then
																fn59(arg, humanoid, humanoidRootPart)
															end
														end)

														table.insert(tbl25, connection3)

														local connection4 = humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
															if not tbl20.antiRagdollEnabled then
																return
															end

															if humanoid.PlatformStand then
																fn59(arg, humanoid, humanoidRootPart)
															end
														end)

														table.insert(tbl25, connection4)

														local connection5 = humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
															if not tbl20.antiRagdollEnabled then
																return
															end

															if not (n24 >= 3890) then
																if humanoid.Sit then
																	humanoid.Sit = false
																	fn59(arg, humanoid, humanoidRootPart)
																end

																return
															end

															while true do
															end
														end)

														table.insert(tbl25, connection5)
														local health = humanoid.Health

														local connection6 = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
															if not flag21 and humanoid.Health < health then
																if tbl20.cancelAndRecoverAutoGrab then
																	pcall(function()
																		tbl20.cancelAndRecoverAutoGrab("HitDamage")
																	end)
																end
															end

															health = humanoid.Health
														end)

														table.insert(tbl25, connection6)
													end
												end
											end

											connection = nil

											fn57 = function()
												if v83.Character then
													fn58(v83.Character)
												end

												if not connection then
													connection = v83.CharacterAdded:Connect(function(character)
														if tbl20.antiRagdollEnabled then
															task.wait(0.1)
															fn58(character)
														end
													end)
												end
											end
										end

										do
											local function fn58()
												for _, v88 in ipairs(tbl25) do
													pcall(function()
														v88:Disconnect()
													end)
												end

												tbl25 = {}

												if connection then
													connection:Disconnect()
													connection = nil
												end
											end

											fn48 = function(antiRagdollEnabled)
												tbl20.antiRagdollEnabled = antiRagdollEnabled

												if antiRagdollEnabled then
													fn57()
												else
													fn58()
												end

												fn31()
											end
										end
									end

									do
										local n32

										do
											n32 = 0

											do
												local function fn57()
													local tbl25 = {}
													local n33 = 0
													local flag22 = v82[139]

													local function fn58()
														local character = v83.Character

														local function fn59(arg)
															if not arg then
																return nil
															end

															for _, child in ipairs(arg:GetChildren()) do
																if child:IsA("Tool") then
																	local str8 = child.Name:lower()
																	if str8:find("medusa") or str8:find("head") or str8:find("stone") then
																		return child
																	end
																end
															end
														end

														return character and fn59(character) or fn59(v83:FindFirstChild("Backpack"))
													end

													local function fn59()
														if flag22 then
															return
														end

														if tick() - n33 < 1.5 then
															return
														end
														local character = v83.Character
														if not character then
															return
														end
														flag22 = true
														local v88 = fn58()

														if v88 then
															if v88.Parent ~= character then
																local humanoid = character:FindFirstChildOfClass("Humanoid")

																if humanoid then
																	humanoid:EquipTool(v88)
																end
															end

															if v88.Parent == character then
																pcall(function()
																	v88:Activate()
																end)
															end

															n33 = tick()
														end

														flag22 = false
													end

													local function fn60(arg)
														return arg:GetPropertyChangedSignal("Anchored"):Connect(function()
															if arg.Anchored and arg.Transparency == 1 then
																n32 = tick()
																fn59()
															end
														end)
													end

													local function fn61(arg)
														if not flag3 then
															return
														end

														for _, v88 in ipairs(tbl25) do
															pcall(function()
																v88:Disconnect()
															end)
														end

														tbl25 = {}
														if not arg then
															return
														end

														for _, descendant in ipairs(arg:GetDescendants()) do
															if descendant:IsA("BasePart") then
																table.insert(tbl25, fn60(descendant))
															end
														end

														table.insert(tbl25, arg.DescendantAdded:Connect(function(descendant)
															if descendant:IsA("BasePart") then
																table.insert(tbl25, fn60(descendant))
															end
														end))
													end

													local function fn62()
														for _, v88 in ipairs(tbl25) do
															pcall(function()
																v88:Disconnect()
															end)
														end

														tbl25 = {}
													end

													fn36 = function(medusaCounterEnabled)
														tbl20.medusaCounterEnabled = medusaCounterEnabled

														if medusaCounterEnabled then
															if v83.Character then
																fn61(v83.Character)
															end
														else
															fn62()
														end

														fn31()
													end

													v83.CharacterAdded:Connect(function(character)
														if tbl20.medusaCounterEnabled then
															fn61(character)
														end
													end)
												end

												fn57()
											end
										end

										local tbl25 = {
											"HumanoidRootPart",
											"UpperTorso",
											"LowerTorso",
											"Torso",
											"Head",
										}

										local function fn57(arg)
											arg:WaitForChild("HumanoidRootPart", v82[21])
											task.wait(0.2)

											for _, v88 in ipairs(tbl25) do
												local v89 = arg:FindFirstChild(v88)

												if v89 and v89:IsA("BasePart") then
													v89:GetPropertyChangedSignal("Anchored"):Connect(function()
														if v89.Anchored and v89.Transparency >= 1 then
															n32 = tick()
														end
													end)
												end
											end
										end

										if v83.Character then
											task.spawn(fn57, v83.Character)
										end

										v83.CharacterAdded:Connect(function(character)
											task.spawn(fn57, character)
										end)
									end

									do
										local function fn57()
											local flag22 = v82[139]
											local connection = nil

											local function fn58()
												local playerGui2 = v83:FindFirstChild("PlayerGui") or v83:WaitForChild("PlayerGui", 10)
												if not playerGui2 then
													return
												end

												local function fn59(descendant)
													if descendant:IsA("GuiButton") and descendant.Name == "JumpButton" and not descendant:GetAttribute("XluIJHooked") then
														descendant:SetAttribute("XluIJHooked", true)

														descendant.MouseButton1Down:Connect(function()
															if tbl20.infJumpEnabled then
																flag22 = v82[173]
															end
														end)

														descendant.MouseButton1Up:Connect(function()
															flag22 = false
														end)

														descendant.MouseLeave:Connect(function()
															flag22 = false
														end)
													end
												end

												for _, descendant in ipairs(playerGui2:GetDescendants()) do
													fn59(descendant)
												end

												playerGui2.DescendantAdded:Connect(fn59)
											end

											local function fn59()
												if connection then
													connection:Disconnect()
													connection = nil
												end

												connection = service.Heartbeat:Connect(function()
													if not tbl20.infJumpEnabled then
														return
													end
													local character = v83.Character
													if not character then
														return
													end
													local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
													local humanoid = character:FindFirstChildOfClass("Humanoid")
													if not humanoidRootPart or not humanoid then
														return
													end
													local flag23 = UserInputService:IsKeyDown(Enum.KeyCode.Space) or flag22 or humanoid.Jump == true
													local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity

													if flag23 and assemblyLinearVelocity.Y < 35 then
														humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 55, assemblyLinearVelocity.Z)

														pcall(function()
															humanoidRootPart.Velocity = Vector3.new(assemblyLinearVelocity.X, 55, assemblyLinearVelocity.Z)
														end)
													end

													assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity

													if assemblyLinearVelocity.Y < -v82[109] then
														humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, -v82[109], assemblyLinearVelocity.Z)

														pcall(function()
															humanoidRootPart.Velocity = Vector3.new(assemblyLinearVelocity.X, -v82[109], assemblyLinearVelocity.Z)
														end)
													end
												end)
											end

											local function fn60()
												flag22 = false

												if connection then
													connection:Disconnect()
													connection = nil
												end
											end

											fn35 = function(infJumpEnabled)
												tbl20.infJumpEnabled = infJumpEnabled

												if infJumpEnabled then
													pcall(function()
														if workspace.FallenPartsDestroyHeight > -50000 then
															workspace.FallenPartsDestroyHeight = -50000
														end

														local character = v83.Character
														character = character and character:FindFirstChildOfClass("Humanoid")

														if character then
															character.BreakJointsOnDeath = false
															character.RequiresNeck = false
															character:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
															character:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
															character:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
														end
													end)

													fn59()
												else
													fn60()
												end

												fn31()
											end

											service.Heartbeat:Connect(function()
												if not tbl20.infJumpEnabled then
													return
												end
												local character = v83.Character
												if not character then
													return
												end
												local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
												local humanoid = character:FindFirstChildOfClass("Humanoid")
												if not humanoidRootPart or not humanoid then
													return
												end

												if humanoid.FloorMaterial ~= Enum.Material.Air then
													local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity

													if assemblyLinearVelocity.Y < v82[63] then
														humanoidRootPart.AssemblyLinearVelocity = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)

														pcall(function()
															humanoidRootPart.Velocity = Vector3.new(assemblyLinearVelocity.X, v82[63], assemblyLinearVelocity.Z)
														end)
													end

													pcall(function()
														humanoid.PlatformStand = false
														humanoid.BreakJointsOnDeath = false
														humanoid.RequiresNeck = false
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
														humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
														humanoid.MaxHealth = math.huge
														humanoid.Health = math.huge
													end)
												end
											end)

											UserInputService.InputBegan:Connect(function(input, gameProcessed)
												if gameProcessed then
													return
												end

												if input.KeyCode == Enum.KeyCode.Space then
													if tbl20.infJumpEnabled then
														flag22 = true
													end
												end
											end)

											UserInputService.InputEnded:Connect(function(input)
												if input.KeyCode == Enum.KeyCode.Space then
													flag22 = false
												end
											end)

											task.spawn(fn58)

											v83.CharacterAdded:Connect(function()
												task.wait(0.2)
												fn58()

												if tbl20.infJumpEnabled then
													fn59()
												end
											end)
										end

										fn57()
									end
								end

								do
									local tbl25, currentAnimPack, v88, connection, clone, fn57

									do
										tbl25 = {
											Zombie = {
												idle1 = "rbxassetid://616158929",
												idle2 = "rbxassetid://616158929",
												walk = "rbxassetid://616168032",
												run = "rbxassetid://616163682",
												jump = "rbxassetid://616161997",
												fall = "rbxassetid://616157476",
												climb = "rbxassetid://616156119",
											},
											Ninja = {
												idle1 = "rbxassetid://656117400",
												idle2 = "rbxassetid://656117400",
												walk = "rbxassetid://656121766",
												run = "rbxassetid://656118852",
												jump = "rbxassetid://656117878",
												fall = "rbxassetid://656115606",
												climb = "rbxassetid://656114359",
											},
											Knight = {
												idle1 = "rbxassetid://657595757",
												idle2 = "rbxassetid://657595757",
												walk = "rbxassetid://657552124",
												run = "rbxassetid://657564596",
												jump = "rbxassetid://658409194",
												fall = "rbxassetid://657600338",
												climb = "rbxassetid://658360781",
											},
											Elder = {
												idle1 = "rbxassetid://845397899",
												idle2 = "rbxassetid://845397899",
												walk = "rbxassetid://845403856",
												run = "rbxassetid://845386501",
												jump = "rbxassetid://845398858",
												fall = "rbxassetid://845397673",
												climb = "rbxassetid://845392038",
											},
											Levitate = {
												idle1 = "rbxassetid://616006778",
												idle2 = "rbxassetid://616006778",
												walk = "rbxassetid://616013216",
												run = "rbxassetid://616013216",
												jump = "rbxassetid://616008936",
												fall = "rbxassetid://616005863",
												climb = "rbxassetid://616003713",
											},
											Astronaut = {
												idle1 = "rbxassetid://891621366",
												idle2 = "rbxassetid://891621366",
												walk = "rbxassetid://891636393",
												run = "rbxassetid://891636393",
												jump = "rbxassetid://891627522",
												fall = "rbxassetid://891617961",
												climb = "rbxassetid://891609353",
											},
											Pirate = {
												idle1 = "rbxassetid://750781874",
												idle2 = "rbxassetid://750781874",
												walk = "rbxassetid://750785693",
												run = "rbxassetid://750783738",
												jump = "rbxassetid://750782230",
												fall = "rbxassetid://750780242",
												climb = "rbxassetid://750779899",
											},
											Toy = {
												idle1 = "rbxassetid://782841498",
												idle2 = "rbxassetid://782841498",
												walk = "rbxassetid://782843345",
												run = "rbxassetid://782842708",
												jump = "rbxassetid://782847020",
												fall = "rbxassetid://782846423",
												climb = "rbxassetid://782843869",
											},
											Vampire = {
												idle1 = "rbxassetid://1083445855",
												idle2 = "rbxassetid://1083445855",
												walk = "rbxassetid://1083473930",
												run = "rbxassetid://1083462077",
												jump = "rbxassetid://1083455352",
												fall = "rbxassetid://1083443587",
												climb = "rbxassetid://1083439238",
											},
											Werewolf = {
												idle1 = "rbxassetid://1083195517",
												idle2 = "rbxassetid://1083195517",
												walk = "rbxassetid://1083178339",
												run = "rbxassetid://1083216690",
												jump = "rbxassetid://1083218792",
												fall = "rbxassetid://1083189019",
												climb = "rbxassetid://1083182000",
											},
											Rthro = {
												idle1 = "rbxassetid://2510196951",
												idle2 = "rbxassetid://2510196951",
												walk = "rbxassetid://2510202577",
												run = "rbxassetid://2510198475",
												jump = "rbxassetid://2510197830",
												fall = "rbxassetid://2510195892",
												climb = "rbxassetid://2510192778",
											},
											Stylish = {
												idle1 = "rbxassetid://616136790",
												idle2 = "rbxassetid://616136790",
												walk = "rbxassetid://616146177",
												run = "rbxassetid://616140816",
												jump = "rbxassetid://616139451",
												fall = "rbxassetid://616134815",
												climb = "rbxassetid://616133594",
											},
											["Hit Harder"] = {
												idle1 = "rbxassetid://133806214992291",
												idle2 = "rbxassetid://94970088341563",
												walk = "rbxassetid://707897309",
												run = "rbxassetid://707861613",
												jump = "rbxassetid://116936326516985",
												fall = "rbxassetid://116936326516985",
												climb = "rbxassetid://116936326516985",
											},
											Crazy = {
												idle1 = "rbxassetid://133806214992291",
												idle2 = "rbxassetid://94970088341563",
												walk = "rbxassetid://134824450619865",
												run = "rbxassetid://134824450619865",
												jump = "rbxassetid://121454505477205",
												fall = "rbxassetid://94788218468396",
												climb = "rbxassetid://121454505477205",
											},
										}

										currentAnimPack = "OFF"
										v88 = nil
										connection = nil
										clone = nil

										do
											local function fn58(arg)
												for _, v89 in pairs(tbl25) do
													for _, v90 in pairs(v89) do
														if v90 == arg then
															return true
														end
													end
												end

												return false
											end

											fn57 = function(arg)
												arg = arg and arg:FindFirstChild("Animate")
												if not arg or v88 ~= nil then
													return
												end

												local function fn59(arg2)
													return arg2 and arg2.AnimationId or nil
												end

												local tbl26 = {
													idle1 = fn59(arg.idle and arg.idle:FindFirstChild("Animation1")),
													idle2 = fn59(arg.idle and arg.idle:FindFirstChild("Animation2")),
													walk = fn59(arg.walk and arg.walk:FindFirstChild("WalkAnim")),
													run = fn59(arg.run and arg.run:FindFirstChild("RunAnim")),
													jump = fn59(arg.jump and arg.jump:FindFirstChild("JumpAnim")),
													fall = fn59(arg.fall and arg.fall:FindFirstChild("FallAnim")),
													climb = fn59(arg.climb and arg.climb:FindFirstChild("ClimbAnim")),
												}

												if not fn58(tbl26.walk) then
													v88 = tbl26
												end
											end
										end
									end

									do
										local function fn58(arg)
											arg = arg and arg:FindFirstChildOfClass("Humanoid")
											if not arg then
												return
											end

											for _, v89 in ipairs(arg:GetPlayingAnimationTracks()) do
												pcall(function()
													v89:Stop(v82[63])
												end)
											end
										end

										local function fn59(arg, animationId)
											if arg and animationId then
												pcall(function()
													arg.AnimationId = animationId
												end)
											end
										end

										local function fn60(parent)
											if parent and not parent:FindFirstChild("Animate") and clone then
												clone:Clone().Parent = parent
												clone = nil
											end
										end

										local function fn61(arg)
											currentAnimPack = arg or "OFF"
											tbl20.currentAnimPack = currentAnimPack

											if connection then
												connection:Disconnect()
												connection = nil
											end

											local character = v83.Character
											if not character then
												return
											end

											if currentAnimPack == "Unwalk" then
												local animate = character:FindFirstChild("Animate")

												if animate then
													if not clone then
														clone = animate:Clone()
													end

													fn58(character)
													animate:Destroy()
												end

												return
											end

											fn60(character)

											if currentAnimPack == "OFF" or currentAnimPack == "Off" then
												currentAnimPack = "OFF"
												tbl20.currentAnimPack = "OFF"
												local animate = character:FindFirstChild("Animate")

												if animate and v88 then
													fn58(character)
													fn59(animate.idle and animate.idle:FindFirstChild("Animation1"), v88.idle1)
													fn59(animate.idle and animate.idle:FindFirstChild("Animation2"), v88.idle2)
													fn59(animate.walk and animate.walk:FindFirstChild("WalkAnim"), v88.walk)
													fn59(animate.run and animate.run:FindFirstChild("RunAnim"), v88.run)
													fn59(animate.jump and animate.jump:FindFirstChild("JumpAnim"), v88.jump)
													fn59(animate.fall and animate.fall:FindFirstChild("FallAnim"), v88.fall)
													fn59(animate.climb and animate.climb:FindFirstChild("ClimbAnim"), v88.climb)
												end

												return
											end

											local v89 = tbl25[currentAnimPack]
											if not v89 then
												return
											end
											fn57(character)
											local animate = character:FindFirstChild("Animate")

											if animate then
												fn59(animate.idle and animate.idle:FindFirstChild("Animation1"), v89.idle1)
												fn59(animate.idle and animate.idle:FindFirstChild("Animation2"), v89.idle2)
												fn59(animate.walk and animate.walk:FindFirstChild("WalkAnim"), v89.walk)
												fn59(animate.run and animate.run:FindFirstChild("RunAnim"), v89.run)
												fn59(animate.jump and animate.jump:FindFirstChild("JumpAnim"), v89.jump)
												fn59(animate.fall and animate.fall:FindFirstChild("FallAnim"), v89.fall)
												fn59(animate.climb and animate.climb:FindFirstChild("ClimbAnim"), v89.climb)
											end

											fn58(character)
											local humanoid = character:FindFirstChildOfClass("Humanoid")

											if humanoid then
												pcall(function()
													humanoid:ChangeState(Enum.HumanoidStateType.Landed)
												end)
											end

											connection = service.Heartbeat:Connect(function()
												local character2 = v83.Character
												local animate2 = character2 and character2:FindFirstChild("Animate")
												if not animate2 then
													return
												end
												fn59(animate2.idle and animate2.idle:FindFirstChild("Animation1"), v89.idle1)
												fn59(animate2.idle and animate2.idle:FindFirstChild("Animation2"), v89.idle2)
												fn59(animate2.walk and animate2.walk:FindFirstChild("WalkAnim"), v89.walk)
												fn59(animate2.run and animate2.run:FindFirstChild("RunAnim"), v89.run)
												fn59(animate2.jump and animate2.jump:FindFirstChild("JumpAnim"), v89.jump)
												fn59(animate2.fall and animate2.fall:FindFirstChild("FallAnim"), v89.fall)
												fn59(animate2.climb and animate2.climb:FindFirstChild("ClimbAnim"), v89.climb)
											end)
										end

										fn49 = function(arg)
											fn61(arg)
											fn31(true)
										end

										v83.CharacterAdded:Connect(function()
											v88 = nil
											clone = nil

											if currentAnimPack ~= "OFF" and currentAnimPack ~= "Off" then
												task.wait(0.3)
												fn61(currentAnimPack)
											end
										end)
									end
								end

								do
									local flag22 = v82[139]

									setUnwalkEnabled = function(unwalkEnabled)
										tbl20.unwalkEnabled = unwalkEnabled

										if unwalkEnabled then
											if flag22 then
												return
											end
											flag22 = true
											local character = v83.Character
											if not character then
												return
											end
											local humanoid = character:FindFirstChildOfClass("Humanoid")

											if humanoid then
												for _, v88 in ipairs(humanoid:GetPlayingAnimationTracks()) do
													v88:Stop()
												end
											end

											local animate = character:FindFirstChild("Animate")

											if animate then
												AnimRefs.savedAnimate = animate:Clone()
												animate:Destroy()
											end
										else
											if not flag22 then
												return
											end
											flag22 = false
											local character = v83.Character

											if character and AnimRefs.savedAnimate then
												AnimRefs.savedAnimate.Parent = character
												AnimRefs.savedAnimate.Disabled = false
												AnimRefs.savedAnimate = nil
											end
										end

										fn31()
									end
								end

								do
									local tbl25 = {}

									local function fn57()
										for _, player in ipairs(service2:GetPlayers()) do
											if player ~= v83 and player.Character then
												for _, child in ipairs(player.Character:GetChildren()) do
													if child:IsA("BasePart") then
														child.CanCollide = false
													end
												end
											end
										end
									end

									local flag22 = false
									local v88 = nil

									local function fn58()
										if flag22 then
											return
										end

										if flag20 then
											return
										end
										local character = v83.Character
										if not character then
											return
										end
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return
										end
										local humanoid = character:FindFirstChildOfClass("Humanoid")
										if not humanoid or humanoid.Health <= v82[63] then
											return
										end

										for _, v89 in ipairs(tbl25) do
											if typeof(v89) == "RBXScriptConnection" then
												v89:Disconnect()
											elseif type(v89) == "thread" then
												pcall(coroutine.close, v89)
											end
										end

										tbl25 = {}
										flag22 = v82[173]
										flag21 = true

										pcall(function()
											if humanoidRootPart.SetNetworkOwner then
												humanoidRootPart:SetNetworkOwner(v83)
											end
										end)

										if tbl20.cancelAndRecoverAutoGrab then
											pcall(function()
												tbl20.cancelAndRecoverAutoGrab("Drop")
											end)
										end

										local connection = service.Stepped:Connect(function()
											if flag21 then
												fn57()
											end
										end)

										table.insert(tbl25, connection)
										local enabled = nil

										if v84 then
											enabled = v84.Enabled
										end

										if enabled then
											v84.PlaneVelocity = Vector2.zero
										end

										humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
										humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, v82[74], 0)

										task.delay(0.2, function()
											for _, v89 in ipairs(tbl25) do
												if typeof(v89) == "RBXScriptConnection" then
													v89:Disconnect()
												elseif type(v89) == "thread" then
													pcall(coroutine.close, v89)
												end
											end

											tbl25 = {}

											pcall(function()
												fn40()
											end)

											task.delay(0.05, function()
												if tbl20.cancelAndRecoverAutoGrab then
													pcall(function()
														tbl20.cancelAndRecoverAutoGrab("DropLanded")
													end)
												end

												if tbl20.autoGrabEnabled and _G.VampireStealModes and _G.VampireStealModes.Start then
													pcall(_G.VampireStealModes.Start)
												end
											end)

											if tbl20.autoBatOnDropBrainrot then
												task.spawn(function()
													task.wait(v82[51])

													if fn32 then
														fn32(true)
													end
												end)
											end

											if tbl20.tpBatOnDropBrainrot then
												task.spawn(function()
													task.wait(0.05)

													if fn33 then
														fn33(true)
													end
												end)
											end

											flag22 = false

											task.delay(v82[190], function()
												flag21 = false
											end)
										end)
									end

									fn50 = function()
										fn58()
									end

									v83.CharacterRemoving:Connect(function()
										flag21 = v82[139]
										flag22 = false

										if v88 then
											pcall(function()
												v88:Disconnect()
											end)

											v88 = nil
										end

										_dropBrainrotActive = false

										if _dropBrainrotConn then
											pcall(function()
												_dropBrainrotConn:Disconnect()
											end)

											_dropBrainrotConn = nil
										end

										if tbl22 then
											local v89 = tbl22
											local v90 = tbl22
											tbl22.humanoid = nil
											v89.hrp = nil
											v90.speedLabel = nil
										end

										local v89 = ipairs
										local tbl26 = tbl25 or {}

										for _, v90 in v89(tbl26) do
											if typeof(v90) == "RBXScriptConnection" then
												v90:Disconnect()
											elseif type(v90) == "thread" then
												pcall(coroutine.close, v90)
											end
										end

										tbl25 = {}
									end)
								end
							end

							do
								do
									local tbl25 = {}

									local function fn57()
										if flag20 then
											return
										end
										flag20 = v82[173]

										if tbl20.circleEnabled then
											tbl20.circleEnabled = false
											task.defer(stopCircle)
										end
									end

									local function fn58()
										flag20 = false
									end

									local function fn59(arg)
										if not arg or not arg:IsA("Sound") or tbl25[arg] then
											return
										end

										tbl25[arg] = {
											playingConn = arg:GetPropertyChangedSignal("Playing"):Connect(function()
												if arg.Playing then
													fn57()
												else
													fn58()
												end
											end),
											endedConn = arg.Ended:Connect(fn58),
										}

										if arg.Playing then
											fn57()
										end
									end

									service4.DescendantAdded:Connect(function(descendant)
										if descendant:IsA("Sound") and descendant.Name:lower():find("countdown") then
											fn59(descendant)
										end
									end)

									task.defer(function()
										fn29(service4, function(arg)
											if arg:IsA("Sound") and arg.Name:lower():find("countdown") then
												fn59(arg)
											end

											return false
										end, 180)
									end)
								end

								do
									local connection, v88, fn57, fn58

									do
										connection = nil

										do
											local flag22 = v82[139]
											v88 = nil

											fn57 = function(arg)
												if not arg then
													return nil, nil
												end
												local n32 = 1e9
												local v89 = nil
												local v90 = nil

												for _, player in ipairs(service2:GetPlayers()) do
													if player ~= v83 then
														local character = player.Character

														if character then
															local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
															local humanoid = character:FindFirstChildOfClass("Humanoid")

															if humanoidRootPart and humanoid and humanoid.Health > v82[63] and humanoidRootPart.Position.Y >= -25 then
																local magnitude = (humanoidRootPart.Position - arg.Position).Magnitude

																if magnitude < n32 then
																	n32 = magnitude
																	v89 = player
																	v90 = humanoidRootPart
																end
															end
														end
													end
												end

												return v89, v90
											end

											local function fn59()
												local character = v83.Character
												if not character then
													return nil
												end

												for _, child in ipairs(character:GetChildren()) do
													if child:IsA("Tool") then
														local str8 = child.Name:lower()
														if str8:find("bat") or str8:find("slap") or str8:find("sword") or str8:find("knife") or str8:find("blade") or str8:find("mace") then
															return child
														end

														if child:FindFirstChildWhichIsA("RemoteEvent") or child:FindFirstChild("Activate") then
															return child
														end
													end
												end

												local backpack = v83:FindFirstChild("Backpack")

												if backpack then
													for _, child in ipairs(backpack:GetChildren()) do
														if child:IsA("Tool") then
															local str8 = child.Name:lower()

															if str8:find("bat") or str8:find("slap") or str8:find("sword") or str8:find("knife") or str8:find("blade") or str8:find("mace") then
																local humanoid = character:FindFirstChildOfClass("Humanoid")

																if humanoid then
																	pcall(function()
																		humanoid:EquipTool(child)
																	end)
																end

																child.Parent = character
																return child
															end
														end
													end
												end

												return nil
											end

											fn58 = function()
												if flag22 then
													return
												end
												flag22 = true

												pcall(function()
													local v89 = fn59()

													if v89 then
														if v89.Parent ~= v83.Character then
															v89.Parent = v83.Character
															local humanoid = v83.Character and v83.Character:FindFirstChildOfClass("Humanoid")

															if humanoid then
																pcall(function()
																	humanoid:EquipTool(v89)
																end)
															end
														end

														pcall(function()
															v89:Activate()
														end)

														local remoteEvent = v89:FindFirstChildWhichIsA("RemoteEvent") or v89:FindFirstChildOfClass("RemoteEvent")

														if remoteEvent then
															pcall(function()
																remoteEvent:FireServer()
															end)
														end
													end
												end)

												task.delay(tbl20.tpBatSwingDelay or 0.1, function()
													flag22 = false
												end)
											end
										end
									end

									do
										local function fn59()
											if connection then
												return
											end
											v88 = nil

											connection = service.Heartbeat:Connect(function()
												if not tbl20.tpBatEnabled then
													return
												end

												if tbl20.safeModeEnabled then
													local character = v83.Character
													local humanoid = character and character:FindFirstChildOfClass("Humanoid")

													if humanoid and humanoid.WalkSpeed < 25 then
														fn33(false)

														if win and win.Notify then
															win:Notify("Safe Mode", "Blocked · Safe Mode · brainrot", 1.5)
														end

														return
													end
												end

												local character = v83.Character
												if not character then
													return
												end
												local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
												local humanoid = character:FindFirstChildOfClass("Humanoid")
												if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
													return
												end
												local v89 = v88
												local v90 = v88

												if v89 then
													local humanoid2 = v89.Parent and v89.Parent:FindFirstChildOfClass("Humanoid")

													if not humanoid2 or humanoid2.Health <= 0 then
														v88 = nil
														v90 = nil
													else
														v90 = v89
													end
												end

												if not v90 then
													local v91
													v91, v90 = fn57(humanoidRootPart)
													v88 = v90
												end

												if not v90 then
													return
												end
												local v91 = v90

												pcall(function()
													if sethiddenproperty then
														sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", v91)
													end
												end)

												local assemblyLinearVelocity = v91.AssemblyLinearVelocity or Vector3.zero
												local n32 = v91.Position + assemblyLinearVelocity * 0.05 + Vector3.new(v82[63], v82[183], 0)
												local vector = Vector3.new(assemblyLinearVelocity.X, v82[63], assemblyLinearVelocity.Z)

												if vector.Magnitude < v82[23] then
													vector = Vector3.new(v91.Position.X - humanoidRootPart.Position.X, 0, v91.Position.Z - humanoidRootPart.Position.Z)
												end

												pcall(function()
													if v82[51] < vector.Magnitude then
														humanoidRootPart.CFrame = CFrame.lookAt(n32, n32 + vector.Unit)
													else
														humanoidRootPart.CFrame = CFrame.new(n32)
													end

													if (humanoidRootPart.Position - v91.Position).Magnitude > 3.5 then
														local position = v91.Position
														humanoidRootPart.CFrame = CFrame.lookAt(v91.Position + Vector3.new(0, 0.4, 0), position)
													end

													humanoidRootPart.AssemblyLinearVelocity = assemblyLinearVelocity
													humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
												end)

												local currentCamera = workspace.CurrentCamera

												if currentCamera then
													pcall(function()
														currentCamera.CFrame = CFrame.lookAt(currentCamera.CFrame.Position, v91.Position + Vector3.new(0, 1, 0))
													end)
												end

												fn58()
											end)
										end

										local function fn60()
											tbl20.tpBatEnabled = false

											if connection then
												connection:Disconnect()
												connection = nil
											end

											v88 = nil
											local character = v83.Character
											local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart then
												pcall(function()
													if sethiddenproperty then
														sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", nil)
													end
												end)
											end
										end

										fn33 = function(tpBatEnabled)
											if tpBatEnabled and tbl20.safeModeEnabled then
												local character = v83.Character
												character = character and character:FindFirstChildOfClass("Humanoid")

												if character and character.WalkSpeed < 25 then
													if win and win.Notify then
														win:Notify("Safe Mode", "Cannot use TP Bat while carrying in Safe Mode!", 2)
													end

													return
												end
											end

											tbl20.tpBatEnabled = tpBatEnabled

											if tpBatEnabled then
												fn59()
											else
												fn60()
											end

											fn31()
										end
									end

									tbl20._bindTpBatStopEvent = function()
										pcall(function()
											local packages = ReplicatedStorage:WaitForChild("Packages", v82[171])
											local net = packages and packages:WaitForChild("Net", v82[171])
											net = net and net:WaitForChild("RE/9f6f251400de424a5105a9ea47b3acb7df3f36f460594bf2d2167c7e2272d468", 3)
											if not net or not net:IsA("RemoteEvent") then
												return
											end

											if tbl20._tpBatStopEventConn then
												tbl20._tpBatStopEventConn:Disconnect()
											end

											tbl20._tpBatStopEventConn = net.OnClientEvent:Connect(function()
												if tbl20.tpBatEnabled or connection then
													fn33(false)
												end
											end)
										end)
									end
								end
							end

							do
								task.spawn(tbl20._bindTpBatStopEvent)

								do
									local tbl25 = {}
									local connection = nil
									local tbl26 = {}

									local function fn57(arg)
										local v88 = tbl25[arg]

										if v88 then
											if v88.gui then
												pcall(function()
													v88.gui:Destroy()
												end)
											end

											tbl25[arg] = nil
										end
									end

									local function fn58(arg)
										if not tbl20.playerSpeedEnabled then
											return
										end

										if arg == v83 then
											return
										end
										local character = arg.Character
										if not character then
											return
										end
										local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
										if not head then
											return
										end
										fn57(arg)
										local billboardGui = Instance.new("BillboardGui")
										billboardGui.Name = "PlrSpeedBillboard"
										billboardGui.Size = UDim2.new(v82[63], v82[37], v82[63], 42)
										billboardGui.StudsOffset = Vector3.new(v82[63], 3.5, 0)
										billboardGui.AlwaysOnTop = true
										billboardGui.MaxDistance = 250
										billboardGui.Adornee = head
										billboardGui.Parent = head
										local textLabel = Instance.new("TextLabel")
										textLabel.Size = UDim2.new(1, 0, 0.45, 0)
										textLabel.BackgroundTransparency = 1
										textLabel.Text = arg.DisplayName
										textLabel.TextColor3 = Color3.fromRGB(255, 255, v82[14])
										textLabel.Font = Enum.Font.MontserratBold
										textLabel.TextScaled = true
										textLabel.TextStrokeTransparency = 0.2
										textLabel.Parent = billboardGui
										local textLabel2 = Instance.new("TextLabel")
										textLabel2.Size = UDim2.new(1, 0, 0.55, v82[63])
										textLabel2.Position = UDim2.new(v82[63], 0, 0.45, 0)
										textLabel2.BackgroundTransparency = 1
										textLabel2.Text = "Speed: 0"
										textLabel2.TextColor3 = color
										textLabel2.Font = Enum.Font.MontserratBlack
										textLabel2.TextScaled = v82[173]
										textLabel2.TextStrokeTransparency = 0
										textLabel2.Parent = billboardGui
										tbl25[arg] = { gui = billboardGui, label = textLabel2, lastPos = nil, smooth = 0 }
									end

									fn51 = function(playerSpeedEnabled)
										tbl20.playerSpeedEnabled = playerSpeedEnabled

										if playerSpeedEnabled then
											for _, player in ipairs(service2:GetPlayers()) do
												if player ~= v83 then
													task.spawn(fn58, player)

													if not tbl26[player] then
														tbl26[player] = player.CharacterAdded:Connect(function()
															if tbl20.playerSpeedEnabled then
																task.spawn(fn58, player)
															end
														end)
													end
												end
											end

											if not connection then
												connection = service.Heartbeat:Connect(function(deltaTime)
													local now2 = tick()

													for k, v88 in pairs(tbl25) do
														local character = k.Character
														character = character and character:FindFirstChild("HumanoidRootPart")

														if character and v88.label and v88.label.Parent then
															local position = character.Position
															local assemblyLinearVelocity = character.AssemblyLinearVelocity
															local n32 = math.sqrt(assemblyLinearVelocity.X * assemblyLinearVelocity.X + assemblyLinearVelocity.Z * assemblyLinearVelocity.Z)

															if v88.lastPos and v88.lastTime then
																local n33 = now2 - v88.lastTime

																if n33 > 0.01 then
																	local n34 = position.X - v88.lastPos.X
																	local n35 = position.Z - v88.lastPos.Z
																	n32 = math.max(n32, math.sqrt(n34 * n34 + n35 * n35) / n33)
																end
															end

															v88.smooth = v88.smooth + (n32 - v88.smooth) * math.clamp(deltaTime * 14, 0, 1)

															if v88.smooth < 0.2 then
																v88.smooth = 0
															end

															v88.label.Text = string.format("Speed: %.1f", v88.smooth)
															v88.label.TextColor3 = color
															v88.lastPos = position
															v88.lastTime = now2
														end
													end
												end)
											end
										else
											if connection then
												connection:Disconnect()
												connection = nil
											end

											for _, v88 in pairs(tbl26) do
												pcall(function()
													v88:Disconnect()
												end)
											end

											tbl26 = {}

											for k in pairs(tbl25) do
												fn57(k)
											end

											tbl25 = {}
										end

										fn31()
									end

									service2.PlayerAdded:Connect(function(player)
										if player == v83 then
											return
										end

										if tbl20.playerSpeedEnabled then
											tbl26[player] = player.CharacterAdded:Connect(function()
												if tbl20.playerSpeedEnabled then
													task.spawn(fn58, player)
												end
											end)
										end
									end)

									service2.PlayerRemoving:Connect(function(player)
										if tbl26[player] then
											tbl26[player]:Disconnect()
											tbl26[player] = nil
										end

										fn57(player)
									end)
								end
							end

							do
								do
									local tbl25 = {
										timerActive = false,
										detConns = {},
										charConn = nil,
										timerOn = false,
										animGen = 0,
									}

									local function fn57(arg)
										if not arg then
											return false
										end
										local humanoid = arg:FindFirstChildOfClass("Humanoid")
										if not humanoid or humanoid.Health <= v82[63] then
											return false
										end

										if humanoid.PlatformStand or humanoid.Sit then
											return true
										end
										local state = humanoid:GetState()
										if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.PlatformStanding then
											return true
										end

										for _, v88 in ipairs({ "Ragdoll", "Ragdolled", "IsRagdoll", "RagdollTime", "Knocked", "Stunned", "Down" }) do
											if arg:FindFirstChild(v88) then
												return true
											end
										end

										return false
									end

									local function fn58()
										if tbl22.ragLabel and tbl22.ragLabel.Parent then
											return tbl22.ragLabel
										end
										local character = v83.Character
										local head = character and (character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart"))
										if not head then
											return nil
										end
										local speedBillboard = head:FindFirstChild("SpeedBillboard")

										if not speedBillboard and character and fn45 then
											pcall(function()
												fn45(character)
											end)

											speedBillboard = head:FindFirstChild("SpeedBillboard")
										end

										if speedBillboard then
											local ragdollLabel = speedBillboard:FindFirstChild("RagdollLabel")

											if not ragdollLabel then
												ragdollLabel = Instance.new(v82[61])
												ragdollLabel.Name = "RagdollLabel"
												ragdollLabel.Size = UDim2.new(v82[103], v82[63], 0.35, v82[63])
												ragdollLabel.Position = UDim2.new(0, 0, 0, 0)
												ragdollLabel.BackgroundTransparency = 1
												ragdollLabel.TextColor3 = Color3.fromRGB(255, 255, v82[14])
												ragdollLabel.Font = Enum.Font.MontserratBlack
												ragdollLabel.TextScaled = true
												ragdollLabel.TextStrokeTransparency = 0
												ragdollLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, v82[63])
												ragdollLabel.Text = "2.5s"
												ragdollLabel.Visible = false
												ragdollLabel.Parent = speedBillboard
											end

											tbl22.ragLabel = ragdollLabel
											return ragdollLabel
										end

										return nil
									end

									local function fn59()
										if tbl25.timerActive or not tbl20.ragTimerEnabled then
											return
										end
										local v88 = fn58()
										if not v88 then
											return
										end
										tbl25.timerActive = true
										tbl25.animGen = tbl25.animGen + 1
										local animGen = tbl25.animGen
										local now2 = tick()
										v88.Text = "2.5s"
										v88.TextColor3 = Color3.fromRGB(255, 255, v82[14])
										v88.Visible = true

										task.spawn(function()
											while true do
												if tbl25.timerActive and tbl25.animGen == animGen then
													local n32 = 2.5 - tick() - now2

													if not (n32 <= v82[63]) then
														local v89 = fn58()

														if v89 then
															v89.Text = string.format("%.1fs", n32)

															if n32 <= 0.8 then
																v89.TextColor3 = Color3.fromRGB(255, 80, 80)
															elseif n32 <= 1.5 then
																v89.TextColor3 = Color3.fromRGB(255, 200, v82[42])
															else
																v89.TextColor3 = Color3.fromRGB(v82[14], v82[14], v82[14])
															end

															v89.Visible = true
														end

														task.wait(0.03)
														continue
													end
												end

												break
											end

											if tbl25.animGen == animGen then
												local v89 = fn58()

												if v89 then
													v89.Visible = false
												end

												tbl25.timerActive = false
											end
										end)
									end

									local function fn60(arg)
										for _, detConn in ipairs(tbl25.detConns) do
											pcall(function()
												detConn:Disconnect()
											end)
										end

										tbl25.detConns = {}
										if not arg then
											return
										end
										local humanoid = arg:WaitForChild("Humanoid", 4)

										if humanoid then
											local function fn61()
												if not tbl20.ragTimerEnabled or tbl25.timerActive then
													return
												end

												if fn57(arg) then
													fn59()
												end
											end

											table.insert(tbl25.detConns, humanoid.StateChanged:Connect(function(old, new)
												if not tbl20.ragTimerEnabled or tbl25.timerActive then
													return
												end

												if new == Enum.HumanoidStateType.Physics or new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.PlatformStanding then
													fn59()
												end
											end))

											table.insert(tbl25.detConns, humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
												if humanoid.PlatformStand then
													fn61()
												end
											end))

											table.insert(tbl25.detConns, humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
												if humanoid.Sit then
													fn61()
												end
											end))
										end

										table.insert(tbl25.detConns, arg.ChildAdded:Connect(function(child)
											if not tbl20.ragTimerEnabled or tbl25.timerActive then
												return
											end
											local str8 = child.Name:lower()

											if str8:find("ragdoll") or str8:find("knock") or str8:find("stun") then
												fn59()
											end
										end))

										table.insert(tbl25.detConns, service.Heartbeat:Connect(function()
											if not arg.Parent or not tbl20.ragTimerEnabled then
												return
											end

											if not tbl25.timerActive and fn57(arg) then
												fn59()
											end
										end))
									end

									fn52 = function()
										if not tbl25.timerOn then
											tbl25.timerOn = true

											if v83.Character then
												fn60(v83.Character)
											end

											tbl25.charConn = v83.CharacterAdded:Connect(function(character)
												if tbl20.ragTimerEnabled then
													task.wait(0.15)
													fn60(character)
												end
											end)

											return
										end

										if not (n24 <= 3860) then
											return
										end

										while true do
										end
									end

									fn53 = function()
										tbl25.timerOn = v82[139]

										if tbl25.charConn then
											tbl25.charConn:Disconnect()
											tbl25.charConn = nil
										end

										for _, detConn in ipairs(tbl25.detConns) do
											pcall(function()
												detConn:Disconnect()
											end)
										end

										tbl25.detConns = {}
										tbl25.timerActive = false
										tbl25.animGen = tbl25.animGen + 1
										local v88 = fn58()

										if v88 then
											v88.Visible = false
										end
									end
								end
							end

							do
								local fn57

								do
									tbl24 = {
										conn = nil,
										debounce = false,
										running = false,
										_batCounterWatchConn = nil,
										_batCounterActivatedTP = false,
										_batCounterTarget = nil,
									}

									do
										local tbl25 = {
											"Bat",
											"Slap",
											"Iron Slap",
											"Gold Slap",
											"Diamond Slap",
											"Emerald Slap",
											"Ruby Slap",
											"Dark Matter Slap",
											"Flame Slap",
											"Nuclear Slap",
											"Galaxy Slap",
											"Glitched Slap",
										}

										fn57 = function()
											local character = v83.Character
											if not character then
												return nil
											end
											local backpack = v83:FindFirstChildOfClass("Backpack")

											for _, v88 in ipairs(tbl25) do
												local v89 = character:FindFirstChild(v88) or backpack and backpack:FindFirstChild(v88)
												if v89 and v89:IsA("Tool") then
													return v89
												end
											end

											for _, child in ipairs(character:GetChildren()) do
												local isTool = child:IsA("Tool")
												local pos

												if isTool then
													pos = child.Name:lower():find("bat") or child.Name:lower():find("slap") or child.Name:lower():find("sword") or child.Name:lower():find("blade")
												else
													pos = isTool
												end

												if pos then
													return child
												end
											end

											if backpack then
												for _, child in ipairs(backpack:GetChildren()) do
													if child:IsA("Tool") and (child.Name:lower():find("bat") or child.Name:lower():find("slap") or child.Name:lower():find("sword") or child.Name:lower():find("blade")) then
														return child
													end
												end
											end

											for _, child in ipairs(character:GetChildren()) do
												if child:IsA("Tool") then
													return child
												end
											end

											if backpack then
												for _, child in ipairs(backpack:GetChildren()) do
													if child:IsA("Tool") then
														return child
													end
												end
											end

											return nil
										end
									end
								end

								do
									local function fn58(arg, parent)
										local humanoid = parent:FindFirstChildOfClass("Humanoid")

										if arg.Parent ~= parent then
											arg.Parent = parent

											if humanoid then
												pcall(function()
													humanoid:EquipTool(arg)
												end)
											end

											task.wait(0.04)
										end

										local remoteEvent = arg:FindFirstChildOfClass("RemoteEvent") or arg:FindFirstChildOfClass("RemoteFunction")

										if remoteEvent and remoteEvent:IsA("RemoteEvent") then
											pcall(function()
												remoteEvent:FireServer()
											end)

											task.wait(0.12)

											pcall(function()
												remoteEvent:FireServer()
											end)
										elseif n26(2943) < 13597 then
											pcall(function()
												arg:Activate()
											end)

											task.wait(0.12)

											pcall(function()
												arg:Activate()
											end)
										else
											while true do
											end
										end
									end

									fn54 = function(arg)
										if not arg or arg.Health <= 0 then
											return false
										end

										if arg.PlatformStand or arg.Sit then
											return v82[173]
										end
										local state = arg:GetState()
										if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown or state == Enum.HumanoidStateType.PlatformStanding then
											return v82[173]
										end
										local parent = arg.Parent

										if parent then
											for _, v88 in ipairs({ "Ragdoll", "Ragdolled", "IsRagdoll", "RagdollTime", "Knocked", "Stunned", "Down" }) do
												if parent:FindFirstChild(v88) then
													return v82[173]
												end
											end
										end

										return v82[139]
									end

									local function fn59()
										local humanoidRootPart = v83.Character and v83.Character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return nil
										end
										local huge = math.huge
										local v88 = nil

										for _, player in ipairs(service2:GetPlayers()) do
											if player ~= v83 and player.Character then
												local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
												local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

												if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
													local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

													if magnitude < huge then
														huge = magnitude
														v88 = player
													end
												end
											end
										end

										return v88
									end

									fn55 = function()
										if tbl24._batCounterWatchConn then
											pcall(function()
												tbl24._batCounterWatchConn:Disconnect()
											end)

											tbl24._batCounterWatchConn = nil
										end

										if tbl24._batCounterActivatedTP then
											tbl24._batCounterActivatedTP = v82[139]
											fn33(v82[139])
										end

										tbl24._batCounterTarget = nil
									end

									fn56 = function()
										fn59()
										local character = v83.Character
										local v88 = fn57()

										if v88 and character then
											fn58(v88, character)
										end
									end
								end
							end
						end

						local fn57, fn58, fn59, fn60, fn61

						do
							do
								do
									local connection, tbl25, connection2, fn62

									do
										fn57 = function()
											if tbl24.running then
												return
											end
											tbl24.running = v82[173]

											if tbl24.conn then
												pcall(function()
													tbl24.conn:Disconnect()
												end)
											end

											tbl24.conn = service.Heartbeat:Connect(function()
												if not tbl20.batCounterEnabled or tbl24.debounce then
													return
												end
												local character = v83.Character
												if not character then
													return
												end
												local humanoid = character:FindFirstChildOfClass("Humanoid")
												if not humanoid then
													return
												end

												if fn54(humanoid) then
													tbl24.debounce = true

													task.spawn(function()
														fn56()
														task.wait(0.4)
														tbl24.debounce = false
													end)
												end
											end)
										end

										fn58 = function()
											tbl24.running = false

											if tbl24.conn then
												pcall(function()
													tbl24.conn:Disconnect()
												end)

												tbl24.conn = nil
											end

											tbl24.debounce = v82[139]
											fn55()
										end

										connection = nil
										tbl25 = {}
										connection2 = nil

										do
											local function fn63(arg)
												if not arg or _G.HD_RESETTING then
													return
												end
												local humanoid = arg:WaitForChild("Humanoid", 5)
												if not humanoid then
													return
												end

												pcall(function()
													if _G.HD_RESETTING then
														return
													end
													service4.FallenPartsDestroyHeight = -50000
													humanoid.BreakJointsOnDeath = false
													humanoid.RequiresNeck = false
													humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
													humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
													humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, v82[139])
												end)

												humanoid.MaxHealth = math.huge
												humanoid.Health = math.huge

												local connection3 = humanoid.StateChanged:Connect(function(old, new)
													if not tbl20.antiDieEnabled or _G.HD_RESETTING then
														return
													end

													if new == Enum.HumanoidStateType.Dead or new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.Ragdoll then
														pcall(function()
															if _G.HD_RESETTING then
																return
															end
															humanoid.BreakJointsOnDeath = false
															humanoid.RequiresNeck = false
															humanoid.MaxHealth = math.huge
															humanoid.Health = math.huge
															humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, v82[139])
															humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, v82[139])
															humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, v82[139])
															humanoid.PlatformStand = false
														end)
													end
												end)

												table.insert(tbl25, connection3)

												pcall(function()
													if _G.HD_RESETTING then
														return
													end
													humanoid.BreakJointsOnDeath = false
													humanoid.RequiresNeck = false
													humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
													humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
													humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
												end)

												local connection4 = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
													if not tbl20.antiDieEnabled or _G.HD_RESETTING then
														return
													end

													if humanoid.Health < math.huge then
														pcall(function()
															if _G.HD_RESETTING then
																return
															end
															humanoid.BreakJointsOnDeath = false
															humanoid.RequiresNeck = false
															humanoid.MaxHealth = math.huge
															humanoid.Health = math.huge
															humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
														end)
													end
												end)

												table.insert(tbl25, connection4)

												if connection then
													connection:Disconnect()
												end

												connection = service.Heartbeat:Connect(function()
													if not tbl20.antiDieEnabled or _G.HD_RESETTING then
														return
													end

													if humanoid and humanoid.Parent then
														if humanoid.MaxHealth ~= math.huge then
															humanoid.MaxHealth = math.huge
														end

														if humanoid.Health < math.huge then
															humanoid.BreakJointsOnDeath = false
															humanoid.RequiresNeck = false
															humanoid.Health = math.huge
														end
													end
												end)
											end

											fn62 = function()
												for _, v88 in ipairs(tbl25) do
													pcall(function()
														v88:Disconnect()
													end)
												end

												tbl25 = {}

												if connection then
													connection:Disconnect()
													connection = nil
												end

												if connection2 then
													connection2:Disconnect()
													connection2 = nil
												end

												fn63(v83.Character)

												connection2 = v83.CharacterAdded:Connect(function(character)
													if not tbl20.antiDieEnabled then
														return
													end
													task.wait(v82[190])

													for _, v88 in ipairs(tbl25) do
														pcall(function()
															v88:Disconnect()
														end)
													end

													tbl25 = {}
													fn63(character)
												end)
											end
										end
									end

									do
										local function fn63()
											for _, v88 in ipairs(tbl25) do
												pcall(function()
													v88:Disconnect()
												end)
											end

											tbl25 = {}

											if connection then
												connection:Disconnect()
												connection = nil
											end

											if connection2 then
												if n27(3795) >= 13141 then
													connection2:Disconnect()
													connection2 = nil
												else
													while true do
													end
												end
											end

											local character = v83.Character

											if character then
												local humanoid = character:FindFirstChildOfClass("Humanoid")

												if humanoid then
													pcall(function()
														service4.FallenPartsDestroyHeight = -500
														humanoid.RequiresNeck = true
														humanoid.BreakJointsOnDeath = true
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
														humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
														humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)

														if humanoid.MaxHealth == math.huge then
															humanoid.MaxHealth = 100
														end

														if humanoid.Health > v82[106] then
															humanoid.Health = v82[106]
														end
													end)
												end
											end
										end

										fn59 = function(antiDieEnabled)
											tbl20.antiDieEnabled = antiDieEnabled

											if antiDieEnabled then
												fn62()
											else
												fn63()
											end

											fn31()
										end
									end
								end

								do
									local connection, fn62

									do
										connection = nil

										do
											local flag22 = false

											fn62 = function()
												if connection then
													return
												end
												flag22 = false

												connection = service.Heartbeat:Connect(function()
													local character = v83.Character
													local humanoid = character and character:FindFirstChildOfClass("Humanoid")
													if not character or not humanoid or humanoid.Health <= v82[63] then
														flag22 = false
														return
													end

													if humanoid.WalkSpeed < v82[27] then
														if tbl20.circleEnabled then
															fn32(false)
														end

														if tbl20.tpBatEnabled then
															fn33(false)
														end

														flag22 = true
													elseif flag22 then
														flag22 = false

														if tbl20.autoBatOnDropBrainrot then
															task.spawn(function()
																task.wait(v82[51])

																if fn32 then
																	fn32(true)
																end
															end)
														end

														if tbl20.tpBatOnDropBrainrot then
															task.spawn(function()
																task.wait(0.05)

																if fn33 then
																	fn33(true)
																end
															end)
														end
													end
												end)
											end
										end
									end

									do
										local function fn63()
											if connection then
												connection:Disconnect()
												connection = nil
											end
										end

										fn60 = function(arg)
											tbl20.safeModeEnabled = arg ~= false

											if tbl20.safeModeEnabled then
												fn62()

												if tbl20.bodyLockEnabled then
													fn37(false)
												end
											else
												fn63()
											end
										end
									end
								end

								do
									local connection = nil

									local function fn62()
										local character = v83.Character
										local humanoid = character and character:FindFirstChildOfClass("Humanoid")

										if humanoid then
											pcall(function()
												humanoid.AutoRotate = true
											end)
										end
									end

									local function fn63()
										local character = v83.Character
										character = character and character:FindFirstChild("HumanoidRootPart")
										if not character or character.Position.Y < -20 then
											return nil
										end
										local n32 = tonumber(tbl20.bodyLockRange) or 50
										local v88 = nil

										for _, player in ipairs(service2:GetPlayers()) do
											if player ~= v83 and player.Character then
												local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
												local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

												if humanoidRootPart and humanoid and humanoid.Health > 0 and humanoidRootPart.Position.Y > -v82[79] then
													local magnitude = (character.Position - humanoidRootPart.Position).Magnitude

													if magnitude <= n32 then
														n32 = magnitude
														v88 = humanoidRootPart
													end
												end
											end
										end

										return v88
									end

									fn37 = function(bodyLockEnabled)
										if bodyLockEnabled and tbl20.safeModeEnabled then
											if fn60 then
												if n26(769) <= 5395 then
													fn60(false)
												else
													while true do
													end
												end
											end

											fn31()

											if win and win.Notify then
												win:Notify("Body Lock", "Safe Mode turned OFF for Body Lock.", v82[122])
											end
										end

										tbl20.bodyLockEnabled = bodyLockEnabled

										if connection then
											connection:Disconnect()
											connection = nil
										end

										fn62()

										if bodyLockEnabled then
											connection = service.RenderStepped:Connect(function()
												if not tbl20.bodyLockEnabled or tbl20.safeModeEnabled then
													if connection then
														connection:Disconnect()
														connection = nil
													end

													fn62()
													return
												end

												local character = v83.Character
												local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
												character = character and character:FindFirstChildOfClass("Humanoid")
												if not humanoidRootPart or not character or character.Health <= 0 or humanoidRootPart.Position.Y < -v82[79] then
													fn62()
													return
												end
												local v88 = fn63()

												if v88 and v88.Position.Y > -v82[79] then
													local position = humanoidRootPart.Position
													local position2 = v88.Position
													local n32 = position2.X - position.X
													local n33 = position2.Z - position.Z

													if n32 * n32 + n33 * n33 > 0.4 then
														character.AutoRotate = false
														humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(CFrame.lookAt(position, Vector3.new(position2.X, position.Y, position2.Z)), 0.42)
													else
														character.AutoRotate = true
													end
												else
													character.AutoRotate = true
												end
											end)
										else
											fn62()
										end

										fn31()
									end
								end
							end

							do
								local connection, fn62

								do
									connection = nil

									do
										local v88 = v82[63]

										fn62 = function()
											local now2 = os.clock()
											if now2 - v88 < 0.25 then
												return
											end
											v88 = now2

											for _, player in ipairs(service2:GetPlayers()) do
												if player ~= v83 and player.Character then
													for _, child in ipairs(player.Character:GetChildren()) do
														if child:IsA("BasePart") and child.CanCollide then
															child.CanCollide = v82[139]
														end
													end
												end
											end
										end
									end
								end

								do
									local function fn63()
										if connection then
											return
										end

										connection = service.Stepped:Connect(function()
											if not tbl20.antiCollisionEnabled then
												if connection then
													connection:Disconnect()
													connection = nil
												end

												return
											end

											fn62()
										end)
									end

									fn61 = function()
										tbl20.antiCollisionEnabled = true
										fn63()
									end

									task.defer(function()
										fn63()
									end)

									v83.CharacterAdded:Connect(function()
										task.wait(0.2)
										fn63()
									end)
								end
							end

							do
								local v88, flag22, thread, v89, flag23, flag24, fn62

								do
									v88 = v83

									if UserInputService.TouchEnabled then
									end

									flag22 = false
									thread = nil
									v89 = nil
									flag23 = v82[139]
									flag24 = false

									do
										local flag25 = false

										pcall(function()
											service:UnbindFromRenderStep("HookResetCamPin")
										end)

										fn62 = function(arg, arg2)
											if not arg or not arg.Parent then
												return false
											end
											local humanoid = arg:FindFirstChildOfClass("Humanoid")
											if not humanoid then
												return false
											end

											pcall(function()
												local v90 = humanoid
												local v91 = arg2
												local hipHeight

												if arg2 then
													hipHeight = v91
												else
													hipHeight = 2
												end

												v90.HipHeight = hipHeight
												local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

												if humanoidRootPart then
													local position = humanoidRootPart.Position

													if (position.X ~= position.X or position.Y ~= position.Y or position.Z ~= position.Z or math.abs(position.X) > 1000000 or math.abs(position.Y) > 1000000 or math.abs(position.Z) > 1000000) and fn40 then
														pcall(fn40, v82[173])
													end

													humanoidRootPart.CanCollide = v82[173]
												end

												for _, child in ipairs(arg:GetChildren()) do
													if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
														child.CanCollide = v82[173]
													end
												end
											end)

											return v82[173]
										end

										fn38 = function()
											if flag22 then
												return
											end
											flag22 = true
											flag23 = v82[139]
											flag24 = false
											_G.HD_RESETTING = v82[173]

											if tbl20.antiDieEnabled and stopCleanAntiDie then
												pcall(stopCleanAntiDie)
											end

											if tbl20._cancelAutoGrabInFlight then
												pcall(tbl20._cancelAutoGrabInFlight)
											end

											tbl23.active = v82[139]
											local character = v88.Character

											if not character then
												_G.HD_RESETTING = false
												flag22 = false
												return
											end

											local humanoid = character:FindFirstChildOfClass("Humanoid")

											if not humanoid then
												_G.HD_RESETTING = false
												flag22 = v82[139]
												return
											end

											pcall(function()
												humanoid.RequiresNeck = true
												humanoid.BreakJointsOnDeath = true
												humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, v82[173])
											end)

											v89 = character
											local v90 = v82[139]

											thread = task.spawn(function()
												local hipHeight = humanoid.HipHeight
												local n32 = 0

												while true do
													if character and character.Parent and humanoid and humanoid.Health > 0 and not v90 and not flag24 then
														if v88.Character ~= character then
															v90 = v82[173]
															break
														else
															pcall(function()
																humanoid.HipHeight = 1e30
																humanoid.AutoRotate = true
																local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

																if humanoidRootPart then
																	humanoidRootPart.CanCollide = false
																end

																for _, child in ipairs(character:GetChildren()) do
																	if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
																		child.CanCollide = v82[139]
																	end
																end
															end)

															if not character or not character.Parent or not humanoid or humanoid.Health <= 0 or v88.Character ~= character then
																flag23 = v82[173]
																break
															else
																n32 += v82[103]
																if not (v82[33] <= n32) then
																	task.wait()
																	continue
																end
															end
														end
													end

													break
												end

												if not flag23 then
													if character and character.Parent and humanoid and humanoid.Health > 0 and not v90 then
														local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

														if humanoidRootPart then
															local position = humanoidRootPart.Position

															if position.X ~= position.X or position.Y ~= position.Y or position.Z ~= position.Z or math.abs(position.X) > 5000 or math.abs(position.Y) > 5000 or math.abs(position.Z) > 5000 then
																if fn40 then
																	pcall(fn40, true)
																end

																task.wait(0.15)
															end
														end

														pcall(function()
															character:BreakJoints()
														end)

														task.wait()

														if not character.Parent or humanoid.Health <= 0 then
															flag23 = v82[173]
														end
													end
												end

												if not flag23 and character and character.Parent and humanoid then
													fn62(character, hipHeight)
												end

												flag22 = false
												thread = nil
												v89 = nil
												flag24 = false

												if not flag23 and not flag25 and character and character.Parent and humanoid and humanoid.Health > 0 and v88.Character == character then
													flag25 = true
													local v91 = character
													local v92 = humanoid

													task.delay(0.2, function()
														if v88.Character == v91 and v91.Parent and v92 and v92.Health > v82[63] then
															fn38()
														else
															flag25 = false
														end
													end)
												else
													flag25 = v82[139]
												end
											end)
										end
									end
								end

								local function fn63()
									flag24 = true

									if thread then
										task.cancel(thread)
										thread = nil
									end

									flag22 = false
									v89 = nil

									if not fn62(v88.Character, 2) then
										task.delay(v82[36], function()
											fn62(v88.Character, v82[122])
										end)
									end
								end

								v88.CharacterAdded:Connect(function()
									_G.HD_RESETTING = false
									fn63()
									flag22 = v82[139]
									v89 = nil
									flag23 = false
									flag24 = false

									if tbl20.antiDieEnabled and startCleanAntiDie then
										task.delay(0.2, startCleanAntiDie)
									end
								end)

								pcall(function()
									local resetLite = playerGui:FindFirstChild("ResetLite")

									if resetLite then
										resetLite:Destroy()
									end

									local resetLite2 = game:GetService("CoreGui"):FindFirstChild("ResetLite")

									if resetLite2 then
										resetLite2:Destroy()
									end
								end)

								pcall(function()
									game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
								end)

								_G.FrameResetLite = { Reset = fn38, Stop = fn63 }
							end
						end

						local fn62, fn63, fn64, tbl25, thread, thread2, tbl26, obj, n32, fn65
						local fn66, fn67, fn68

						do
							do
								do
									local function fn69()
										local currentCamera = service4.CurrentCamera

										if currentCamera then
											pcall(function()
												currentCamera.FieldOfView = tbl20.fov
											end)
										end
									end

									fn62 = function(arg)
										tbl20.fov = math.clamp(math.floor((arg or 80) + 0.5), 80, 120)
										fn69()
										fn31()
									end

									service4:GetPropertyChangedSignal("CurrentCamera"):Connect(fn69)

									v83.CharacterAdded:Connect(function()
										task.wait(v82[75])
										fn69()
									end)
								end
							end

							fn63 = function(arg)
								tbl20.stretchRez = math.clamp(arg or 1, 0.1, v82[103])
								fn31()
							end

							service.RenderStepped:Connect(function()
								if tbl20.stretchRez >= 1 then
									return
								end
								local currentCamera = service4.CurrentCamera

								if currentCamera then
									currentCamera.CFrame = currentCamera.CFrame * CFrame.new(0, 0, 0, 1, 0, v82[63], 0, tbl20.stretchRez, v82[63], 0, 0, v82[103])
								end
							end)

							fn64 = function()
							end

							tbl25 = {}
							thread = nil
							thread2 = nil
							tbl26 = {}
							obj = setmetatable({}, { __mode = "k" })

							do
								local obj2 = setmetatable({}, { __mode = "k" })
								local tbl27 = nil
								local v88 = nil
								n32 = 0

								fn65 = function(arg, arg2)
									if not arg then
										return
									end
									local tbl28 = obj2[arg]

									if not tbl28 then
										tbl28 = { values = {}, captured = {} }
										obj2[arg] = tbl28
									end

									for k, v89 in pairs(arg2) do
										pcall(function()
											if tbl28.captured[k] then
												return
											end

											local ok, result = pcall(function()
												return arg[k]
											end)

											if ok then
												tbl28.values[k] = result
												tbl28.captured[k] = true
												if result == v89 then
													return
												end
											else
												tbl28.captured[k] = v82[173]
											end

											arg[k] = v89
										end)
									end
								end

								fn66 = function(arg)
									task.spawn(function()
										local n33 = 0

										for k, v89 in pairs(obj2) do
											if n32 ~= arg or tbl20.fpsBoostEnabled then
												return
											end

											if k and v89 then
												for k2 in pairs(v89.captured) do
													pcall(function()
														k[k2] = v89.values[k2]
													end)
												end
											end

											n33 += 1

											if n33 % 100 == v82[63] then
												task.wait()
											end
										end

										if n32 == arg and not tbl20.fpsBoostEnabled then
											obj2 = setmetatable({}, { __mode = "k" })
										end
									end)
								end

								fn67 = function()
									if not tbl27 then
										tbl27 = {}

										pcall(function()
											tbl27.QualityLevel = settings().Rendering.QualityLevel
										end)

										pcall(function()
											tbl27.MeshPartDetailLevel = settings().Rendering.MeshPartDetailLevel
										end)
									end

									pcall(function()
										local level01 = Enum.QualityLevel.Level01

										if settings().Rendering.QualityLevel ~= level01 then
											local level012 = Enum.QualityLevel.Level01
											settings().Rendering.QualityLevel = level012
										end
									end)

									pcall(function()
										local level01 = Enum.MeshPartDetailLevel.Level01

										if settings().Rendering.MeshPartDetailLevel ~= level01 then
											local level012 = Enum.MeshPartDetailLevel.Level01
											settings().Rendering.MeshPartDetailLevel = level012
										end
									end)
								end

								fn68 = function()
									if tbl27 then
										if tbl27.QualityLevel then
											pcall(function()
												local qualityLevel = tbl27.QualityLevel
												settings().Rendering.QualityLevel = qualityLevel
											end)
										end

										if tbl27.MeshPartDetailLevel then
											pcall(function()
												local meshPartDetailLevel = tbl27.MeshPartDetailLevel
												settings().Rendering.MeshPartDetailLevel = meshPartDetailLevel
											end)
										end

										tbl27 = nil
									end

									if v88 then
										pcall(function()
											if setfpscap then
												setfpscap(v88)
											end
										end)

										v88 = nil
									end
								end
							end
						end

						do
							do
								local function fn69(arg)
									if not arg or not arg.Parent then
										return
									end
									local character = v83.Character

									if character then
										character = arg == character or arg:IsDescendantOf(character)
									end

									if character then
										return
									end

									if arg == playerGui or arg:IsDescendantOf(playerGui) then
										return
									end

									if arg:IsA("Sky") or arg.Name == "HookDuelsDarkCC" then
										return
									end

									pcall(function()
										if arg:IsA("ParticleEmitter") or arg:IsA("Trail") or arg:IsA("Beam") or arg:IsA("Smoke") or arg:IsA("Fire") or arg:IsA("Sparkles") then
											fn65(arg, { Enabled = false })
										elseif arg:IsA("Highlight") or arg:IsA("SurfaceLight") or arg:IsA("PointLight") or arg:IsA("SpotLight") then
											fn65(arg, { Enabled = false })
										elseif arg:IsA("SelectionBox") then
											fn65(arg, { Visible = false })
										elseif arg:IsA("PostEffect") then
											if not arg:IsA("ColorCorrectionEffect") then
												fn65(arg, { Enabled = false })
											end
										elseif arg:IsA("Atmosphere") then
											fn65(arg, { Density = v82[63], Haze = 0, Glare = 0 })
										elseif arg:IsA("Clouds") then
											fn65(arg, { Density = 0, Cover = v82[63], Enabled = false })
										elseif arg:IsA("Explosion") then
											fn65(arg, { Visible = v82[139] })
										elseif arg:IsA("Decal") or arg:IsA("Texture") then
											fn65(arg, { Transparency = 1 })
										elseif arg:IsA("SurfaceAppearance") then
											fn65(arg, { ColorMap = "", MetalnessMap = "", NormalMap = "", RoughnessMap = "" })
										elseif arg:IsA("SpecialMesh") then
											fn65(arg, { TextureId = "" })
										elseif arg:IsA("Shirt") then
											fn65(arg, { ShirtTemplate = "" })
										elseif arg:IsA("Pants") then
											fn65(arg, { PantsTemplate = "" })
										elseif arg:IsA("ShirtGraphic") then
											fn65(arg, { Graphic = "" })
										elseif arg:IsA("MeshPart") then
											fn65(arg, {
												Material = Enum.Material.SmoothPlastic,
												MaterialVariant = "",
												TextureID = "",
												Reflectance = 0,
												CastShadow = false,
												DoubleSided = false,
											})
										elseif arg:IsA("UnionOperation") or arg:IsA("NegateOperation") then
											fn65(arg, {
												Material = Enum.Material.SmoothPlastic,
												MaterialVariant = "",
												Reflectance = v82[63],
												CastShadow = false,
												UsePartColor = true,
											})
										elseif arg:IsA("BasePart") then
											local tbl27 = {
												Material = Enum.Material.SmoothPlastic,
												MaterialVariant = "",
												Reflectance = 0,
												CastShadow = v82[139],
											}

											if arg:IsA("Part") then
												tbl27.TopSurface = Enum.SurfaceType.Smooth
												tbl27.BottomSurface = Enum.SurfaceType.Smooth
											end

											fn65(arg, tbl27)
										end
									end)
								end

								local function fn70()
									fn65(service3, {
										GlobalShadows = false,
										EnvironmentDiffuseScale = 0,
										EnvironmentSpecularScale = v82[63],
										ShadowSoftness = 0,
										FogEnd = 9e9,
										FogStart = 9e9,
									})

									for _, child in ipairs(service3:GetChildren()) do
										if not child:IsA("Sky") and child.Name ~= "HookDuelsDarkCC" then
											fn69(child)
										end
									end

									local terrain = service4:FindFirstChildOfClass("Terrain")

									if terrain then
										fn65(terrain, {
											WaterWaveSize = 0,
											WaterWaveSpeed = 0,
											WaterReflectance = 0,
											WaterTransparency = 1,
											Decoration = false,
										})

										for _, child in ipairs(terrain:GetChildren()) do
											if child:IsA("Clouds") then
												fn69(child)
											end
										end
									end

									fn67()
								end

								local flag22 = false

								tbl20._setFpsBoost = function(arg, arg2)
									local fpsBoostEnabled = not not arg
									if not arg2 and flag22 == fpsBoostEnabled and tbl20.fpsBoostEnabled == fpsBoostEnabled then
										return
									end
									flag22 = fpsBoostEnabled
									n32 += 1
									local v88 = n32
									tbl20.fpsBoostEnabled = fpsBoostEnabled
									flag19 = fpsBoostEnabled

									if fpsBoostEnabled then
										fn70()

										task.spawn(function()
											local descendants = service4:GetDescendants()
											local n33 = 0

											for i = 1, #descendants do
												if not (not tbl20.fpsBoostEnabled or n32 ~= v88) then
													fn69(descendants[i])
													n33 += 1

													if n33 >= 60 then
														service.Heartbeat:Wait()
														n33 = 0
													end

													continue
												end

												break
											end
										end)

										task.spawn(function()
											local descendants = service3:GetDescendants()

											for i = 1, #descendants do
												if not (not tbl20.fpsBoostEnabled or n32 ~= v88) then
													fn69(descendants[i])
													continue
												end
												break
											end
										end)

										if #tbl25 == 0 then
											tbl25[1] = service4.DescendantAdded:Connect(function(descendant)
												if tbl20.fpsBoostEnabled and #tbl26 < 3000 then
													tbl26[#tbl26 + 1] = descendant
												end
											end)

											tbl25[2] = service3.DescendantAdded:Connect(function(descendant)
												if tbl20.fpsBoostEnabled then
													fn69(descendant)
												end
											end)
										end

										if not thread2 then
											thread2 = task.spawn(function()
												while tbl20.fpsBoostEnabled do
													local v89 = v82[63]

													while v89 < 150 do
														local v90 = table.remove(tbl26, 1)

														if v90 ~= nil then
															v89 += 1

															if v90.Parent and tbl20.fpsBoostEnabled then
																fn69(v90)
															end

															continue
														end

														break
													end

													task.wait(v82[51])
												end

												thread2 = nil
											end)
										end

										if not thread then
											thread = task.spawn(function()
												while tbl20.fpsBoostEnabled do
													pcall(function()
														if service3.GlobalShadows ~= v82[139] then
															service3.GlobalShadows = false
														end

														if service3.EnvironmentDiffuseScale ~= 0 then
															service3.EnvironmentDiffuseScale = 0
														end

														if service3.EnvironmentSpecularScale ~= 0 then
															service3.EnvironmentSpecularScale = 0
														end

														if service3.FogEnd ~= 9e9 then
															service3.FogEnd = 9e9
														end

														if service3.FogStart ~= 9e9 then
															service3.FogStart = 9e9
														end
													end)

													fn67()
													task.wait(v82[70])
												end

												thread = nil
											end)
										end
									else
										for _, v89 in ipairs(tbl25) do
											pcall(function()
												v89:Disconnect()
											end)
										end

										tbl25 = {}

										for _, v89 in pairs(obj) do
											pcall(function()
												v89:Disconnect()
											end)
										end

										obj = setmetatable({}, { __mode = "k" })
										tbl26 = {}
										fn68()
										fn66(v88)
									end
								end
							end
						end

						if tbl20.fpsBoostEnabled then
							task.defer(function()
								pcall(function()
									tbl20._setFpsBoost(v82[173], true)

									if win and win.particles and win.particles.layer then
										win.particles.layer.Visible = false
									end
								end)
							end)
						end

						UserInputService.InputBegan:Connect(function(input, gameProcessed)
							if flag18 then
								return
							end

							if gameProcessed and UserInputService:GetFocusedTextBox() then
								return
							end

							if input.UserInputType.Name:find("Gamepad") then
								local ok, result = pcall(function()
									return game:GetService("GuiService").SelectedObject
								end)

								if ok and result and result.Name == "HookKeybindBox" then
									local flag22

									while true do
										local flag23 = result and result ~= game
										flag22 = true

										if flag23 then
											if result:IsA("GuiObject") and not result.Visible then
												flag22 = false
												break
											elseif result:IsA("LayerCollector") and not result.Enabled then
												flag22 = false
												break
											else
												result = result.Parent
												continue
											end
										end

										break
									end

									if flag22 then
										return
									end
								end
							end

							if fn30(input, tbl21.speed) then
								tbl20.speedToggled = not tbl20.speedToggled

								if carry and carry.setState then
									pcall(function()
										carry.setState(tbl20.speedToggled)
									end)
								end

								fn31()
							elseif fn30(input, tbl21.laggerMode) then
								fn43()
							elseif fn30(input, tbl21.customSpeedMode) then
								fn44()
							elseif fn30(input, tbl21.circle) then
								fn32(not tbl20.circleEnabled)
							elseif fn30(input, tbl21.dropBrainrot) then
								fn50()
							elseif fn30(input, tbl21.tpDown) then
								fn40()
							elseif fn30(input, tbl21.walkLeft) then
								fn46()
							elseif fn30(input, tbl21.tpBat) then
								fn33(not tbl20.tpBatEnabled)
							elseif fn30(input, tbl21.bodyLock) then
								fn37(not tbl20.bodyLockEnabled)
							elseif fn30(input, tbl21.instaReset) then
								fn38()
							end
						end)

						do
							local function fn69()
								fn34 = function(arg)
									local v88 = arg or color
									local hookIntro = playerGui:FindFirstChild("HookIntro")

									if hookIntro then
										hookIntro:Destroy()
									end

									local instance = Instance.new(v82[11])
									instance.Name = "HookIntro"
									instance.ResetOnSpawn = false
									instance.IgnoreGuiInset = true
									instance.DisplayOrder = 9999
									instance.Parent = playerGui
									local imageLabel = Instance.new("ImageLabel")
									imageLabel.AnchorPoint = Vector2.new(0.5, v82[6])
									imageLabel.Position = UDim2.fromScale(0.5, 0.46)
									imageLabel.Size = UDim2.fromScale(0.2, 0.1)
									imageLabel.BackgroundTransparency = 1
									imageLabel.Image = "rbxassetid://5028857472"
									imageLabel.ImageColor3 = v88
									imageLabel.ImageTransparency = v82[103]
									imageLabel.ScaleType = Enum.ScaleType.Slice
									imageLabel.SliceCenter = Rect.new(24, v82[81], 276, 276)
									imageLabel.ZIndex = 1
									imageLabel.Parent = instance
									local imageLabel2 = Instance.new("ImageLabel")
									imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
									imageLabel2.Position = UDim2.fromScale(v82[6], 0.46)
									imageLabel2.Size = UDim2.fromOffset(40, 40)
									imageLabel2.BackgroundTransparency = 1
									imageLabel2.Image = "rbxassetid://266543268"
									imageLabel2.ImageColor3 = v88
									imageLabel2.ImageTransparency = 0.4
									imageLabel2.ZIndex = v82[63]
									imageLabel2.Parent = instance
									local frame = Instance.new("Frame")
									frame.AnchorPoint = Vector2.new(0.5, 0.5)
									frame.Position = UDim2.fromScale(0.5, 0.46)
									frame.Size = UDim2.fromOffset(520, 96)
									frame.BackgroundTransparency = 1
									frame.ZIndex = 2
									frame.Parent = instance

									local function fn70(textColor3, zIndex)
										local instance2 = Instance.new(v82[61])
										instance2.AnchorPoint = Vector2.new(0.5, 0.5)
										instance2.Position = UDim2.fromScale(0.5, v82[6])
										instance2.Size = UDim2.fromScale(1, 1)
										instance2.BackgroundTransparency = 1
										instance2.Text = "HOOK DUELS"
										instance2.Font = Enum.Font.MontserratBlack
										instance2.TextScaled = v82[173]
										instance2.TextColor3 = textColor3
										instance2.ZIndex = zIndex
										instance2.Parent = frame
										instance2.TextStrokeColor3 = Color3.fromRGB(0, 0, v82[63])
										instance2.TextStrokeTransparency = 0.25
										return instance2
									end

									local v89 = fn70(Color3.fromRGB(255, v82[176], 70), 2)
									local v90 = fn70(Color3.fromRGB(50, v82[69], 255), 2)
									local v91 = fn70(Color3.fromRGB(255, v82[14], 255), 4)
									local frame2 = Instance.new("Frame")
									frame2.Size = UDim2.fromScale(1, v82[103])
									frame2.BackgroundTransparency = 1
									frame2.ClipsDescendants = true
									frame2.ZIndex = v82[70]
									frame2.Parent = frame
									local frame3 = Instance.new("Frame")
									frame3.Size = UDim2.new(0, 70, 1.8, 0)
									frame3.Position = UDim2.new(-0.4, 0, -0.4, v82[63])
									frame3.BackgroundColor3 = Color3.fromRGB(255, 255, v82[14])
									frame3.BackgroundTransparency = 0.55
									frame3.BorderSizePixel = 0
									frame3.Rotation = 16
									frame3.ZIndex = 6
									frame3.Parent = frame2
									local instance2 = Instance.new(v82[101], frame3)
									local numberSequence = NumberSequence.new
									local tbl27 = {}
									local v92 = NumberSequenceKeypoint.new(0, 1)
									local v93 = NumberSequenceKeypoint.new(0.5, 0.2)
									tbl27[1] = v92
									tbl27[2] = v93

									do
										local values = table.pack(NumberSequenceKeypoint.new(v82[103], 1))
										table.move(values, 1, values.n, 3, tbl27)
									end

									instance2.Transparency = numberSequence(tbl27)
									local frame4 = Instance.new("Frame")
									frame4.AnchorPoint = Vector2.new(0.5, v82[6])
									frame4.Position = UDim2.fromScale(0.5, 0.66)
									frame4.Size = UDim2.fromOffset(0, 3)
									frame4.BackgroundColor3 = v88
									frame4.BorderSizePixel = 0
									frame4.ZIndex = v82[171]
									frame4.Parent = instance
									Instance.new(v82[140], frame4).CornerRadius = UDim.new(1, v82[63])
									local textLabel = Instance.new("TextLabel")
									textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
									textLabel.Position = UDim2.fromScale(0.5, 0.72)
									textLabel.Size = UDim2.fromOffset(420, 24)
									textLabel.BackgroundTransparency = 1
									textLabel.Text = "discord.gg/hookduels"
									textLabel.Font = Enum.Font.MontserratBold
									textLabel.TextSize = 16
									textLabel.TextColor3 = v88
									textLabel.TextTransparency = 1
									textLabel.ZIndex = 3
									textLabel.Parent = instance
									textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
									textLabel.TextStrokeTransparency = 0.4
									frame.Size = UDim2.fromOffset(286, 53)
									v91.TextTransparency = 1
									v89.TextTransparency = 1
									v90.TextTransparency = 1
									TweenService:Create(frame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(520, 96) }):Play()
									TweenService:Create(v91, TweenInfo.new(0.3), { TextTransparency = 0 }):Play()
									TweenService:Create(v89, TweenInfo.new(v82[75]), { TextTransparency = 0.25 }):Play()
									TweenService:Create(v90, TweenInfo.new(v82[75]), { TextTransparency = 0.25 }):Play()
									TweenService:Create(imageLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quad), { Size = UDim2.fromScale(0.75, 0.5), ImageTransparency = 0.5 }):Play()
									TweenService:Create(imageLabel2, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(560, 560), ImageTransparency = v82[103] }):Play()
									local now2 = tick()

									local connection = service.RenderStepped:Connect(function()
										if tick() - now2 < 0.42 then
											local n33 = math.random(-v82[24], 7)
											v89.Position = UDim2.new(0.5, -v82[171] + n33, 0.5, math.random(-3, 3))
											v90.Position = UDim2.new(0.5, 3 - n33, v82[6], math.random(-3, 3))
											local v94 = v91
											local v95 = v82[23]
											v94.TextTransparency = math.random() < v95 and 0.5 or 0
										else
											v89.Position = UDim2.new(0.5, -v82[122], 0.5, v82[63])
											v90.Position = UDim2.new(0.5, 2, 0.5, 0)
											v91.TextTransparency = 0
										end
									end)

									task.delay(v82[130], function()
										TweenService:Create(frame3, TweenInfo.new(0.6, Enum.EasingStyle.Quad), { Position = UDim2.new(1.1, 0, -0.4, 0) }):Play()
										TweenService:Create(frame4, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(300, 3) }):Play()
										TweenService:Create(textLabel, TweenInfo.new(0.4), { TextTransparency = 0 }):Play()
									end)

									task.delay(1.25, function()
										if connection.Connected then
											connection:Disconnect()
										end

										TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.fromScale(0.5, v82[130]), Size = UDim2.fromOffset(560, 104) }):Play()

										for _, v94 in ipairs({ v91, v89, v90, textLabel }) do
											TweenService:Create(v94, TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
										end

										TweenService:Create(imageLabel, TweenInfo.new(0.4), { ImageTransparency = 1 }):Play()
										TweenService:Create(frame4, TweenInfo.new(v82[130]), { BackgroundTransparency = 1 }):Play()

										task.delay(0.5, function()
											instance:Destroy()
										end)
									end)
								end
							end

							fn69()
						end

						index._startUI = function()
							fn41()
							tbl20.circleEnabled = v82[139]
							tbl20.tpBatEnabled = v82[139]
							tbl23.active = false

							tbl20._clearAutoGrabHud = function()
								for _, child in ipairs(playerGui:GetChildren()) do
									if child.Name == "AutoStealBar" or child.Name == "HookDuelPreDuelWidget" then
										pcall(function()
											child:Destroy()
										end)
									end
								end
							end

							tbl20._clearAutoGrabHud()

							local tbl27 = {
								["Velvet Rose"] = Color3.fromRGB(v82[148], v82[118], 168),
								["Neon Pink"] = Color3.fromRGB(255, 45, 185),
								["Neon Cyan"] = Color3.fromRGB(0, 240, 255),
								["Electric Violet"] = Color3.fromRGB(168, 85, 247),
								["Blood Red"] = Color3.fromRGB(255, 45, v82[102]),
								["Lime Green"] = Color3.fromRGB(60, 235, v82[109]),
								["Golden Yellow"] = Color3.fromRGB(255, 185, v82[33]),
								["Pure White"] = Color3.fromRGB(255, 255, 255),
								Blurple = Color3.fromRGB(126, 134, 255),
								Emerald = Color3.fromRGB(52, 216, v82[168]),
								["Sunset Orange"] = Color3.fromRGB(v82[14], 120, v82[181]),
								["Hot Magenta"] = Color3.fromRGB(255, v82[79], 147),
							}

							local v88 = index.new({
								title = "Hook Duels",
								subtitle = "discord.gg/hookduels",
								theme = "Velvet Rose",
								width = tbl20.guiWidth or 500,
								height = tbl20.guiHeight or 600,
								layout = 2,
								background = v82[103],
								imageTransparency = 1,
							})

							local color2 = Color3.fromRGB(175, 65, 255)
							v88:SetTheme("Velvet Rose")
							v88:SetAccent(color2)
							color = v88.theme.Data.Accent
							BarBgImage = tbl19.Backgrounds[v88._bgIndex] or ""
							local setAccent = v88.SetAccent
							local setTheme = v88.SetTheme

							v88.SetAccent = function(arg, arg2)
								setAccent(arg, arg2)
								color = arg2
							end

							v88.SetTheme = function(arg, arg2)
								setTheme(arg, arg2)
								color = arg.theme.Data.Accent
							end

							local Movement = v88:Tab("Movement", "Speed, jump tools and path automation")
							Movement:Section("SPEED MODES & SWITCHING", "Switch between Normal, Lagger, and Custom speed profiles")

							Movement:Toggle("Auto Switch Speed", tbl20.autoSwitchSpeedEnabled or false, function(autoSwitchSpeedEnabled)
								tbl20.autoSwitchSpeedEnabled = autoSwitchSpeedEnabled
								fn31()
							end)

							Movement:Keybind("Carry Key", tbl21.speed, function(speed)
								tbl21.speed = speed
								fn31()
							end)

							Movement:Keybind("Lagger Key", tbl21.laggerMode or Enum.KeyCode.R, function(laggerMode)
								tbl21.laggerMode = laggerMode
								fn31()
							end)

							Movement:Keybind("Custom Key", tbl21.customSpeedMode or Enum.KeyCode.None, function(customSpeedMode)
								tbl21.customSpeedMode = customSpeedMode
								fn31()
							end)

							Movement:Section("NORMAL MODE SPEEDS", "Standard match speeds")

							Movement:Slider("Normal Speed", 0, 200, tbl20.normalSpeed or 59, function(normalSpeed)
								tbl20.normalSpeed = normalSpeed
								fn31()
							end)

							Movement:Slider("Normal Carry Speed", 0, 200, tbl20.normalCarrySpeed or 29, function(normalCarrySpeed)
								tbl20.normalCarrySpeed = normalCarrySpeed
								fn31()
							end)

							Movement:Section("LAGGER MODE SPEEDS", "Lower speeds for lagger carry optimization")

							Movement:Slider("Lagger Normal Speed", 0, 200, tbl20.laggerNormalSpeed or 35, function(laggerNormalSpeed)
								tbl20.laggerNormalSpeed = laggerNormalSpeed
								fn31()
							end)

							Movement:Slider("Lagger Carry Speed", v82[63], 200, tbl20.laggerCarrySpeed or v82[3], function(laggerCarrySpeed)
								tbl20.laggerCarrySpeed = laggerCarrySpeed
								fn31()
							end)

							Movement:Section("CUSTOM MODE SPEEDS", "Customizable profile speeds")

							Movement:Slider("Custom Normal Speed", 0, v82[74], tbl20.customNormalSpeed or 70, function(customNormalSpeed)
								tbl20.customNormalSpeed = customNormalSpeed
								fn31()
							end)

							Movement:Slider("Custom Carry Speed", 0, v82[74], tbl20.customCarrySpeed or 35, function(customCarrySpeed)
								tbl20.customCarrySpeed = customCarrySpeed
								fn31()
							end)

							Movement:Section("JUMP & MOBILITY", "Infinite jump normal and hold mode")

							Movement:Toggle("Infinite Jump", tbl20.infJumpEnabled, function(arg)
								fn35(arg)
							end)

							local v89 = Movement
							local dropdown = v89.Dropdown
							local tbl28 = { "Normal Mode", "Hold Mode" }

							local function fn69(infJumpMode)
								tbl20.infJumpMode = infJumpMode

								if tbl20.infJumpEnabled then
									fn35(true)
								end

								fn31()
							end

							dropdown(v89, "Method", tbl28, fn69, tbl20.infJumpMode or "Normal Mode")
							Movement:Section("AUTO LEFT/RIGHT", "Semi Auto Play auto-detects your side from your plot sign or location")

							Movement:Keybind("Auto Left/Right Bind", tbl21.walkLeft, function(walkLeft)
								tbl21.walkLeft = walkLeft
								fn31()
							end)

							pcall(function()
								local character = v83.Character
								character = character and character:FindFirstChild("Head")
								character = character and character:FindFirstChild("RagStealBillboard")

								if character then
									character:Destroy()
								end
							end)

							local Combat = v88:Tab("Combat", "Auto hit, grabbing, bat tools and defense")
							Combat:Section("AUTO GRAB", "Nearby target scanning, progress bar and grab version")

							v86 = Combat:Toggle("Auto Grab", tbl20.autoGrabEnabled, function(autoGrabEnabled)
								if fn39 then
									fn39(autoGrabEnabled)
								else
									tbl20.autoGrabEnabled = autoGrabEnabled
								end
							end)

							Combat:Dropdown("Version", { "V1", "V2", "V3" }, function(autoGrabMode)
								tbl20.autoGrabMode = autoGrabMode
								local tbl29 = { V1 = "semi", V2 = "normal", V3 = "normalv2" }

								if _G.VampireStealModes and _G.VampireStealModes.SetMode then
									pcall(_G.VampireStealModes.SetMode, tbl29[autoGrabMode] or "semi")
								end

								fn31()
							end, tbl20.autoGrabMode)

							Combat:Slider("Radius", 5, 300, tbl20.primeRange, function(arg)
								tbl20.primeRange = math.clamp(arg, 5, 300)

								if _G.VampireStealModes and _G.VampireStealModes.State then
									_G.VampireStealModes.State.SemiPrimeRange = tbl20.primeRange
									_G.VampireStealModes.State.NormalRadius = tbl20.primeRange
								end

								fn31()
							end)

							Combat:Toggle("Ragdoll Timer", tbl20.ragTimerEnabled, function(ragTimerEnabled)
								tbl20.ragTimerEnabled = ragTimerEnabled

								if ragTimerEnabled then
									fn52()
								else
									fn53()
								end

								fn31()
							end)

							Combat:Section("BAT TOOLS", "Auto hit, bats and on-drop automation")

							Combat:Toggle("Auto Hit", tbl20.autoHitEnabled, function(arg)
								tbl20._setAutoHit(arg)
							end)

							Combat:Keybind("Auto Bat Key", tbl21.circle, function(circle)
								tbl21.circle = circle
								fn31()
							end)

							Combat:Keybind("TP Bat Key", tbl21.tpBat, function(tpBat)
								tbl21.tpBat = tpBat
								fn31()
							end)

							Combat:Toggle("Auto Bat on Drop Brainrot", tbl20.autoBatOnDropBrainrot or v82[139], function(autoBatOnDropBrainrot)
								tbl20.autoBatOnDropBrainrot = autoBatOnDropBrainrot
								fn31()
							end)

							Combat:Toggle("TP Bat on Drop Brainrot", tbl20.tpBatOnDropBrainrot or v82[139], function(tpBatOnDropBrainrot)
								tbl20.tpBatOnDropBrainrot = tpBatOnDropBrainrot
								fn31()
							end)

							Combat:Section("TELEPORTS", "Quick vertical descent and automatic ground slamming")

							Combat:Toggle("Auto TP Down", tbl20.autoTpDown or v82[139], function(arg)
								fn47(arg)
							end)

							Combat:Slider("Studs", 5, v82[106], tbl20.autoTpDownHeight or 15, function(autoTpDownHeight)
								tbl20.autoTpDownHeight = autoTpDownHeight
								fn31()
							end)

							Combat:Keybind("TP Down Key", tbl21.tpDown, function(tpDown)
								tbl21.tpDown = tpDown
								fn31()
							end)

							Combat:Section("DEFENSE", "Full godmode anti die, auto safe mode, body tracking, anti ragdoll and instant recovery")

							Combat:Keybind("Drop Brainrot", tbl21.dropBrainrot, function(dropBrainrot)
								tbl21.dropBrainrot = dropBrainrot
								fn31()
							end)

							Combat:Toggle("Anti Die", tbl20.antiDieEnabled or v82[139], function(arg)
								fn59(arg)
							end)

							bodyLockToggleRef = Combat:Toggle("Body Lock", tbl20.bodyLockEnabled, function(arg)
								fn37(arg)
							end)

							Combat:Slider("Body Lock Range", 10, 200, tbl20.bodyLockRange or 50, function(bodyLockRange)
								tbl20.bodyLockRange = bodyLockRange
								fn31()
							end)

							Combat:Toggle("Anti Ragdoll", tbl20.antiRagdollEnabled, function(arg)
								fn48(arg)
							end)

							Combat:Toggle("Medusa Counter", tbl20.medusaCounterEnabled, function(arg)
								fn36(arg)
							end)

							local v90 = nil

							v90 = Combat:Toggle("Bat Counter", tbl20.batCounterEnabled, function(batCounterEnabled)
								if batCounterEnabled and tbl20.circleEnabled then
									v90.setState(false)
									v88:Notify("Bat Counter", "Disable Auto Bat first.", 3)
									return
								end

								tbl20.batCounterEnabled = batCounterEnabled

								if batCounterEnabled then
									fn57()
								else
									fn58()
								end

								fn31()
							end)

							Combat:Toggle("Show Player Speeds", tbl20.playerSpeedEnabled, function(arg)
								fn51(arg)
								fn31()
							end)

							Combat:Keybind("Insta Reset", tbl21.instaReset, function(instaReset)
								tbl21.instaReset = instaReset
								fn31()
							end)

							local Settings = v88:Tab("Settings", "Display, performance, mobile and UI configuration")
							Settings:Section("OUTFIT & ANIMATIONS", "Animation packs and character movement styles")

							local tbl29 = {
								"OFF",
								"Zombie",
								"Ninja",
								"Knight",
								"Elder",
								"Levitate",
								"Astronaut",
								"Pirate",
								"Toy",
								"Vampire",
								"Werewolf",
								"Rthro",
								"Stylish",
								"Hit Harder",
								"Crazy",
								"Unwalk",
							}

							local v91 = Settings
							local dropdown2 = v91.Dropdown

							local function fn70(currentAnimPack)
								fn49(currentAnimPack)
								tbl20.currentAnimPack = currentAnimPack
								fn31()
							end

							dropdown2(v91, "Animation Pack", tbl29, fn70, tbl20.currentAnimPack or "OFF")
							Settings:Section("DISPLAY & PERFORMANCE", "Camera view, stretched resolution and anti-lag optimization")

							Settings:Slider("FOV", v82[42], 120, tbl20.fov or 80, function(arg)
								fn62(arg)
							end)

							Settings:Slider("Stretch Rez", 0.1, 1, tbl20.stretchRez or 1, function(arg)
								fn63(arg)
							end, v82[122])

							Settings:Toggle("FPS Boost (Anti-Lag)", tbl20.fpsBoostEnabled or false, function(arg)
								tbl20._setFpsBoost(arg, true)

								if v88.particles and v88.particles.layer then
									v88.particles.layer.Visible = not arg
								end

								fn31()
							end)

							Settings:Section("FLOATING BUTTONS SETTINGS", "Global scaling, locking and visibility")

							Settings:Toggle("Show All Side Buttons", tbl20.floatingBtnsVisible, function(floatingBtnsVisible)
								v88:SetSideBarVisible(floatingBtnsVisible)
								tbl20.floatingBtnsVisible = floatingBtnsVisible
								fn31()
							end)

							Settings:Toggle("Lock Side Buttons", tbl20.lockSideButtons or v82[139], function(lockSideButtons)
								v88:SetSideBarLocked(lockSideButtons)

								if not (n24 > 3876) then
									tbl20.lockSideButtons = lockSideButtons
									fn31()
									return
								end

								while true do
								end
							end)

							Settings:Stepper("Side Buttons Size (%)", 60, 160, 10, math.floor((tbl20.buttonScale or v82[103]) * 100), function(arg)
								tbl20.buttonScale = arg / 100
								v88:SetSideBarScale(tbl20.buttonScale)
								fn31()
							end)

							Settings:Button("Reset Button Positions", function()
								v88:ResetSideButtons()
								tbl20.sideBtnPositions = {}
								fn31()
							end)

							carry = v88:SideButton("CARRY", function(speedToggled)
								tbl20.speedToggled = speedToggled
								local setState = nil

								if v85 then
									setState = v85.setState
								end

								if setState then
									pcall(function()
										v85.setState(speedToggled)
									end)
								end

								fn31()
							end, v82[173])

							carry.setState(tbl20.speedToggled)

							lagger = v88:SideButton("LAGGER", function(arg)
								fn42(arg and "Lagger" or "Normal")
							end, true)

							lagger.setState(tbl20.speedProfile == "Lagger")

							custom = v88:SideButton("CUSTOM", function(arg)
								fn42(arg and "Custom" or v82[32])
							end, true)

							custom.setState(tbl20.speedProfile == v82[187])

							v88:SideButton("AUTO PLAY", function()
								fn46()
							end, false)

							v88:SideButton("TP DOWN", function()
								fn40()
							end, false)

							v88:SideButton("DROP", function()
								fn50()
							end, false)

							v87 = v88:SideButton("AUTO BAT", function(arg)
								fn32(arg)
							end, v82[173])

							v87.setState(tbl20.circleEnabled)

							local function fn71(arg)
								fn33(arg)
							end

							local tpBatEnabled = tbl20.tpBatEnabled
							v88:SideButton("TP BAT", fn71, v82[173]).setState(tpBatEnabled)

							v88:SideButton("RESET", function()
								fn38()
							end, false)

							v88:SetSideBarVisible(tbl20.floatingBtnsVisible)

							pcall(function()
								v88:SetSideButtonPositions(tbl20.sideBtnPositions)
							end)

							v88:OnSideButtonMoved(function()
								tbl20.sideBtnPositions = v88:GetSideButtonPositions()
								fn31()
							end)

							if tbl20.sideBtnVisibility and type(tbl20.sideBtnVisibility) == "table" then
								for k, v92 in pairs(tbl20.sideBtnVisibility) do
									pcall(function()
										v88:SetSideButtonVisible(k, v92)
									end)
								end
							end

							v88:FinalizeBuild()

							if tbl20.fpsBoostEnabled and tbl20._setFpsBoost then
								task.defer(function()
									pcall(function()
										tbl20._setFpsBoost(true, true)

										if v88 and v88.particles and v88.particles.layer then
											v88.particles.layer.Visible = false
										end
									end)
								end)
							end

							pcall(function()
								tbl20.phoneScale = UserInputService.TouchEnabled and not UserInputService.MouseEnabled and 0.85 or v82[103]
								v88:SetScale(tbl20.phoneScale)
								fn31()
							end)

							pcall(function()
								v88:SetImageTransparency(1 - (tbl20.guiImageVis or 85) / 100)
							end)

							pcall(function()
								if tbl20.laggerCarryEnabled then
									setLaggerCarry(true)
								end
							end)

							pcall(function()
								if tbl20.autoTpDown then
									fn47(true)
								end
							end)

							pcall(function()
								if tbl20.autoGrabEnabled then
									fn39(v82[173])
								end
							end)

							pcall(function()
								if tbl20.autoHitEnabled then
									tbl20._setAutoHit(true)
								end
							end)

							pcall(function()
								if tbl20.safeModeEnabled then
									fn60(true)
								end
							end)

							pcall(function()
								fn61(v82[173])
							end)

							pcall(function()
								if tbl20.bodyLockEnabled then
									fn37(true)
								end
							end)

							pcall(function()
								if tbl20.antiRagdollEnabled then
									fn48(true)
								end
							end)

							pcall(function()
								if tbl20.currentAnimPack and tbl20.currentAnimPack ~= "OFF" and tbl20.currentAnimPack ~= "Off" then
									fn49(tbl20.currentAnimPack)
								end
							end)

							pcall(function()
								if tbl20.playerSpeedEnabled then
									if not flag3 then
										return
									end
									fn51(true)
								end
							end)

							pcall(function()
								if tbl20.ragTimerEnabled then
									fn52()
								end
							end)

							pcall(function()
								if tbl20.medusaCounterEnabled then
									fn36(true)
								end
							end)

							pcall(function()
								if tbl20.batCounterEnabled then
									fn57()
								end
							end)

							pcall(function()
								if tbl20.autoEquipBat then
									equipBat()
								end
							end)

							pcall(function()
								if tbl20.infJumpEnabled then
									fn35(true)
								end
							end)

							pcall(applyFov)
							pcall(fn64)

							if tbl20.guiPosition and v88 and v88.main then
								pcall(function()
									v88.main.Position = UDim2.new(tbl20.guiPosition.xScale or v82[6], tbl20.guiPosition.xOffset or 0, tbl20.guiPosition.yScale or 0.5, tbl20.guiPosition.yOffset or v82[63])
								end)
							end
						end

						index._startUI()
						return
					end

					while true do
					end
				end
			end
		end
	end
end

fn14(100, v3[fn2("n\218\192\176\129w\151\190\193\1756", 21845944094585)], v3[fn2("-\209 \r\161\128\30\181)\162\169\194\240\156\19Ȣs\0212\188p\207(\188\240\176\157\230\2\142\167\11\226\159&\233", 10693721171687)] .. v32(v63), Color3[v3[fn2("\211\207k", 18772801209419)]](1, 0, 0), v3[fn2(" `\4\162\157", 18561267614598)])
