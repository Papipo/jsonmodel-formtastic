require 'integration_helper'

class TestFormtasticCompatibility < ActionDispatch::IntegrationTest
  def test_automatic_inputs
    get '/products/new', product: {name: 'MacBook', price: '999', tags: 'laptop, apple'}
    assert_select 'form' do
      assert_select "input[name='product[id]']", count: 0
      assert_select ".required input[name='product[name]'][type='text'][value='MacBook']"
      assert_select ".required input[name='product[price]'][type='number'][value='999']"
      assert_select "input[name='product[tags]'][type='text'][value='laptop, apple']"
    end
  end
end