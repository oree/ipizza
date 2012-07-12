# encoding: UTF-8
require 'time'
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Ipizza::Provider::Swedbank do
  describe '#payment_request' do
    before(:each) do
      @payment = Ipizza::Payment.new(:stamp => 1, :amount => '123.34', :refnum => 1, :message => 'Payment message', :currency => 'EUR')
    end
    
    it 'signs the request' do
      req = Ipizza::Provider::Swedbank.new.payment_request(@payment)
      req.sign_params['VK_MAC'].should == 'aVCFvsLJiczQw9VoYMdtoQKj5fXkP8OI+JfQN8bFGKZGxC/X5gVIIi/Bh9AyB6JXwbeMOfUlnvuJIukpmBpDg3dEWkv4xGwKdfacqwYkgSC17OBb7VmZ+B4d6HYaO088wxH1FBSVa87HKFJ7ScTEJfd3ZEZly9WzTPHiFWvpRGDxAYtuO5nfGMcscxOQ0B0cbrIcLKvqLho25hIgns3+lvRDWsOb9lFH//7U8OBOC9SuXCBwvC4Fng3wqmBSKRJgAqvQ40Y4XpBGt3U/ix26Vs1cP8lOGHUyqzrqKbcmvqqhgWzqpa0JoK6im/MhBePyNnHVoC8Pqw4ZwZb4YrrPXw=='
    end
  end

  describe '#payment_response' do
    before(:each) do
      @params = {
        'VK_T_NO' => '587', 'encoding' => 'UTF-8', 'VK_REC_ID' => 'fraktal', 'VK_REF' => '201107010000080',
        'VK_SND_NAME' => 'TÕNU RUNNEL'.encode('ISO-8859-4'), 'VK_T_DATE' => '01.07.2011', 'VK_STAMP' => '20110701000008', 'VK_SND_ACC' => '1108126403',
        'VK_LANG' => 'EST', 'VK_SERVICE' => '1101', 'VK_REC_NAME' => 'FRAKTAL OÜ'.encode('ISO-8859-4'), 'VK_AMOUNT' => '0.17',
        'VK_MSG' => 'Edicy invoice #20110701000008', 'VK_AUTO' => 'N', 'VK_SND_ID' => 'HP', 'VK_VERSION' => '008', 'VK_ENCODING' => 'ISO-8859-4',
        'VK_REC_ACC' => '221038811930', 'VK_CURR' => 'EUR',
        'VK_MAC' => 'geOA+gjLJlFouGMih0WhbQwTehZM1FVus1OhO34yt8shekINWOzUi6gLymq9HYSDIAx/Gw2iUOKGxzhCRsXu3fxjVVlXpS9YRQfFF8HG1zoU2OUiNBZVa+7bGGDLOy+ZIhnyaW1I3jIFXHd57xDyCVCQvB0Ot4Ya9yE3YMKHTk4='
      }
      
      Ipizza::Provider::Swedbank.file_cert = File.expand_path('../../../certificates/swedbank_production.pem', __FILE__)
    end
    
    it 'parses and verifies the payment response from bank' do
      Ipizza::Provider::Swedbank.new.payment_response(@params).should be_valid
    end
  end

  describe '#authentication_request' do
    before(:each) do
      Time.stub!(:now).and_return(Time.parse("Mar 30 1981"))
      Date.stub!(:today).and_return(Date.parse("Mar 30 1981"))
    end
    
    it 'should sign the request' do
      req = Ipizza::Provider::Swedbank.new.authentication_request
      req.sign_params['VK_MAC'].should == 'C9HV2e9IKnHcFGKjnDjx0caBMnhBtpXeZE8GOFD9Qph/KKO3eAJbMNDGJ7bOBFulot/rZVOVaqYIgTcGEfmg+FV7QgoyVwN5TBRJXdkvYo73qY8I71ONd/7lRrU+T/9b3nI+dRM3Y/D/DeMSe07/Ge9L/IDTnoloUefoOKIEGxmfr+zc0RzJ+S9nev8M+sepyA2LvbGGJKMAiraV/DpQeb3Xf8UnC7UihAjx9NtnXI5DY15YKDupj+FtwoQ4xGgV/M1Xy57XuDajnSU4wbTSqwomTE9PugpbZwqO9zbisMFA6H6PTWXn/henL8EM/D6BnL6DjsqmZlQSckabsNtuBQ=='
    end
  end
  
  describe '#authentication_response' do
    before(:each) do
      @params = {
        'VK_SERVICE' => '3002', 'VK_VERSION' => '008', 'VK_USER' => 'dealer',
        'VK_DATE' => '30.03.1981', 'VK_TIME' => '00:00:00', 'VK_SND_ID' => 'SWEDBANK',
        'VK_INFO' => 'ISIK:37508166516;NIMI:JAAN SAAR',
        'VK_MAC' => 'ds/a+lwQhq1cs34mCqbpkNkXt/6fHwxii5+G+qA9vbhic/6TUnkIiJK+gFUZzMgRKDxOiOTD44zK7P9v58G972YbNvI3+JgZmzXXTkuHOk3wfGQFdNLat+ezMdkt8EU8j6N3TLZ/8UxNl+eKGsm/RJL4QKGpg3/Sfbza22XHERepIrMyFsQXqhnSwDZF2VT6XoRJuYI+nret0pn7Bcm22AFwz4OAv9R6fgRQ2w3m3g0bOZp/ea52fv+8UivNsyo/llbajqJAgCVdRz8Jm9fSg0A/falsVVkefEEgDQwGEElxQwJ9aSj1A/NUA40cqjIIPGhoVtA7/p+VklH88cA0pQ=='
      }
    end
    
    it 'parses and verifies the authentication response from bank' do
      Ipizza::Provider::Swedbank.new.authentication_response(@params).should be_valid
    end
  end
end
