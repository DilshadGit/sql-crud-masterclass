"""Modern SQLAlchemy 2.0 Declarative ORM CRUD Operations"""
from typing import List, Optional
from sqlalchemy import create_engine, String, Float, select, update, delete
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, Session

class Base(DeclarativeBase):
    pass

class Vehicle(Base):
    __tablename__ = "vehicles"

    id: Mapped[int] = mapped_column(primary_key=True)
    brand: Mapped[str] = mapped_column(String(50), index=True)
    model: Mapped[str] = mapped_column(String(50))
    year: Mapped[int] = mapped_column()
    price: Mapped[float] = mapped_column(Float)

    def __repr__(self):
        return f"<Vehicle {self.brand} {self.model} ({self.year}) - ${self.price}>"

engine = create_engine("sqlite:///fleet.db", echo=False)
Base.metadata.create_all(engine)

def create_vehicle(session: Session, brand: str, model: str, year: int, price: float) -> Vehicle:
    car = Vehicle(brand=brand, model=model, year=year, price=price)
    session.add(car)
    session.commit()
    session.refresh(car)
    return car

def get_vehicles_by_brand(session: Session, brand: str) -> List[Vehicle]:
    stmt = select(Vehicle).where(Vehicle.brand == brand).order_by(Vehicle.year.desc())
    return list(session.scalars(stmt).all())

def update_vehicle_price(session: Session, vehicle_id: int, new_price: float) -> Optional[Vehicle]:
    stmt = update(Vehicle).where(Vehicle.id == vehicle_id).values(price=new_price)
    session.execute(stmt)
    session.commit()
    return session.get(Vehicle, vehicle_id)

def delete_vehicle(session: Session, vehicle_id: int) -> bool:
    stmt = delete(Vehicle).where(Vehicle.id == vehicle_id)
    result = session.execute(stmt)
    session.commit()
    return result.rowcount > 0

if __name__ == "__main__":
    with Session(engine) as s:
        v = create_vehicle(s, "Audi", "RS6", 2024, 125000.0)
        print("Created:", v)
        print("Found:", get_vehicles_by_brand(s, "Audi"))
