import pytest
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from python_crud.sqlalchemy_crud import Base, create_vehicle, get_vehicles_by_brand, update_vehicle_price, delete_vehicle

@pytest.fixture
def session():
    engine = create_engine("sqlite:///:memory:")
    Base.metadata.create_all(engine)
    with Session(engine) as s:
        yield s
        Base.metadata.drop_all(engine)

def test_full_crud_lifecycle(session):
    # 1. CREATE
    car = create_vehicle(session, "Porsche", "911 GT3", 2023, 180000.0)
    assert car.id is not None

    # 2. READ
    results = get_vehicles_by_brand(session, "Porsche")
    assert len(results) == 1
    assert results[0].model == "911 GT3"

    # 3. UPDATE
    updated = update_vehicle_price(session, car.id, 175000.0)
    assert updated.price == 175000.0

    # 4. DELETE
    deleted = delete_vehicle(session, car.id)
    assert deleted is True
    assert len(get_vehicles_by_brand(session, "Porsche")) == 0
