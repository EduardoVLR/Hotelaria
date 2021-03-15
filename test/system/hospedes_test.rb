require "application_system_test_case"

class HospedesTest < ApplicationSystemTestCase
  setup do
    @hospede = hospedes(:one)
  end

  test "visiting the index" do
    visit hospedes_url
    assert_selector "h1", text: "Hospedes"
  end

  test "creating a Hospede" do
    visit hospedes_url
    click_on "New Hospede"

    fill_in "Data nascimento", with: @hospede.data_nascimento
    fill_in "Email", with: @hospede.email
    fill_in "Nome", with: @hospede.nome
    fill_in "Telefone", with: @hospede.telefone
    click_on "Create Hospede"

    assert_text "Hospede was successfully created"
    click_on "Back"
  end

  test "updating a Hospede" do
    visit hospedes_url
    click_on "Edit", match: :first

    fill_in "Data nascimento", with: @hospede.data_nascimento
    fill_in "Email", with: @hospede.email
    fill_in "Nome", with: @hospede.nome
    fill_in "Telefone", with: @hospede.telefone
    click_on "Update Hospede"

    assert_text "Hospede was successfully updated"
    click_on "Back"
  end

  test "destroying a Hospede" do
    visit hospedes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hospede was successfully destroyed"
  end
end
