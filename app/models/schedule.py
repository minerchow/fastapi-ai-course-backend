from datetime import date
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import Date, Index, Integer, String
from app.database import Base

class Schedule(Base):
    __tablename__ = "schedules"
    __table_args__ = (
        Index("idx_schedule_user_id", "user_id"),
        Index("idx_schedule_course_id", "course_id"),
        {"comment": "课表信息"},
    )

    user_id: Mapped[int] = mapped_column(
        Integer, comment="学生ID", nullable=False
    )
    class_date: Mapped[date] = mapped_column(Date, comment="上课日期", nullable=False)
    period: Mapped[str] = mapped_column(String(50), comment="节次", nullable=False)
    course_id: Mapped[int] = mapped_column(
        Integer, comment="课程ID", nullable=False
    )
    location: Mapped[str] = mapped_column(String(100), comment="地点", nullable=True)