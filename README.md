# HotTest

中文版:使用distillery来热更新Phoenxi服务器

第一步:
	安装Phoenxi所需要的环境，这里就不做讲解；
第二步:
	在ubuntu用户任意目录下，使用mix phoenix.new --no-ecto hot_test(名字任意)
第三步:
	打开hot_test根目录下的mix.exs 文件添加:
        defp deps do
          [ ...,
            {:distillery, "~> 1.0"},
            ...,
          ]
         end
	然后运行  mix do deps.get
第四部:
	打开根目录下的config/prod.exs文件修改如下:
		config :HotTest.Endpoint,
          	http: [port: {:system, "PORT"}],
          	url: [host: "localhost", port: {:system, "PORT"}], # This is critical for ensuring web-sockets properly authorize.
          	cache_static_manifest: "priv/static/manifest.json",
          	server: true,
          	root: ".",
          	version: Mix.Project.config[:version]
第五步:
	在根目录下打开shell使用: 
	./node_modules/brunch/bin/brunch b -p && MIX_ENV=prod mix do phoenix.digest, release --env=prod 命令
第六部:
	在根目录下使用mkdir local_hot命令创建local_hot目录，然后将_build/prod/rel/hot_test/releases/0.0.1目录下的hot_test_tar.gz
	拷贝到local_hot根目录下，并解压；解压之后可以使用 PORT=4000 ./bin/hot_test start 命令开服；使用TestServer.test 命令测试
	，看控制台的结果
第七部:
	把mix.exs文件中的version版本号改成0.0.2和在test_server.ex模块中做一些输入日志的改动，
	然后使用MIX_ENV=prod mix release --env=prod --upgrade 命令,成功后会在_build/prod/rel/hot_test/releases 目录下多一个0.0.2
	目录，把这目录下的hot_test.tar.gz拷贝到local_hot目录下的0.0.2文件夹下，默认是没有0.0.2目录的，自己创建一个
第八部: 
	进入到local_hot目录下的bin目录使用: ./hot_test upgrade 0.0.2 不出意外就更新到2版本，也可以使用
   	./hot_test upgrade 0.0.1命令，从2版本回滚到1版本，同样用TestServer.test 命令来检测是否成功更新和回滚！
最后:
	祝大家玩的愉快！有问题可以issue 我。


## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
