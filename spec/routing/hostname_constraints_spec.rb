require "rails_helper"

describe "ルーティング" do
  examplpe "職員トップページ" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:staff][:host]}/#{config[:staff][:path]}"
    expect(get: url).to route_to(
      host: config[:staff][:host],
      controller: "staff/top",
      action: "index"
    )
  end
  examplpe "管理者ログインフォーム" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:admin][:host]}/#{config[:admin][:path]}"
    expect(get: url).to route_to(
      host: config[:admin][:host],
      controller: "admin/sessions",
      action: "new"
    )
  end

  example "ホスト名が他使用街ならrouttableではない" do
    expect(get: "http://foo.example.jp").not_to be_routable    
  end

  example "損zないしないパスならroutableではない" do
    expect(get: "http://#{config[:staff][:host]/xyz}").not_to be_routable    
  end
end