class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  STATUS =['Ready for pickup','Under investigation','Documents needed','Animal is sick','Registered but not submitted']
  
  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.search(params[:search])
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        
        NotiferMailer.pet_notifications(@pet).deliver
        
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        #number.has_attribute?('one')
        
        if user_signed_in?
          if Pet.find_by status: 'Ready for pickup' , email: @pet.email
            NotiferMailer.pet_ready(@pet).deliver
          end
          
          if Pet.find_by status: 'Documents needed', email: @pet.email
            NotiferMailer.pet_doc_needed(@pet).deliver
          end 
          
          if Pet.find_by status: 'Animal is sick', email: @pet.email
            NotiferMailer.pet_ill(@pet).deliver
          end
        else
          NotiferMailer.pet_notifications(@pet).deliver
        end
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit ,  UserMailer.with.welcome_email.deliver_now}
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:chip_number, :status, :ownerName, :ownerAdress, :payment, :dateOfArrival, :email, :dogname)
    end
end
