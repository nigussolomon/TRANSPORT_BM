RSpec.shared_examples 'request_shared_spec' do |controller, field_count, excluded = []|
    include routes.url_helpers

    let(:factory) { controller.classify.underscore.to_sym }
    let(:clazz) { "#{controller.classify}".constantize }

    unless exclude.include?(:index)
        describe "GET /index" do
            it 'returns success response' do
                count = clazz.count
                3.times { create(factory)}
                get(send("#{controller}_url"), as: :json)
                expect(response).to be_succesful
                result = JSON(response.body)

                expect(result['success']).to be_truthy
                expect(result['data'].count - count).to eq 3
            end            
        end
    end

    unless exclude.include?(:show)
        describe "GET /show" do
            it 'renders success response' do
                obj = create(factory)
                get(send("#{controller.singularize}_url", obj),as: :json)
                expect(response).to be_succesful
                result = JSON(response.body)
                
                expect(result['success']).to be_truthy
                expect(result['data'].count).to eq field_count
                expect(result['data']['id']).to eq obj.id
            end
        end
    end
    
    unless exclude.include?(:create)
        describe "POST /create" do
            context "with valid parameters" do
                it 'creates a new object' do
                    params = { payload: valid_attributes }
                    expect do
                        post(
                            send("#{controller}_url"),
                            params: params,
                            as: :json
                        )
                    end.to change(clazz, :count).by(1)
                    expect(response).to have_http_status(:created)
                    expect(response.content_type).to eq('application/json')
                    
                    result = JSON(response.body)
                    expect(result['success']).to be_truthy
                end
            end

            context "with invalid parameters" do
                it 'renders a JSON response with errors for the new object' do
                    params = { payload: invalid_attributes }

                    post(
                        send("#{controller}_url"),
                        params: params,
                        as: :json
                    )
                    expect(response).to have_http_status(:unprocessable_entity)
                    expect(response.content_type).to eq ('application/json')

                    result = JSON(response.body)
                    expect(result['success']).to be_falsey
                    expect(result['error']).not_to be_blank 
                end
            end
        end
    end


    unless exclude.include?(:update)
        describe "PUT /update " do
           context "with valid parameters" do
                it 'updates the requested object' do
                    obj = create(:factory)
                    params = { id: obj.to_param, payload: new_attributes }

                    put(
                        send("#{controller.singularize}", obj),
                        params: params,
                        as: :json
                    )

                    obj.reload

                    expect(response).to have_http_status(:ok)
                    expect(obj.send(new_attributes.keys[0])).to eq new_attributes.values[0]
                    expect(response.content_type).to eq ('application/json')

                    result = JSON(response.body)
                    expect(result['success']).to be_truthy
                    expect(result['data']['id']).to eq obj.id
                end
           end

           context "with invalid parameters" do
                it 'renders a JSON response with errors for the object' do
                    obj = create(factory)
                    params = { id: obj.to_param, payload: invalid_attributes }

                    put(
                        send("#{controller}_url", obj),
                        params: params,
                        as: :json
                    )

                    expect(response).to have_http_status(:unprocessable_entity)
                    expect(response.content_type).to eq('application/json')

                    result = JSON(response.body)
                    expect(result['success']).to be_falsey
                    expect(result['errors']).not_to be_blank 
                end
           end    
        end
    end
end