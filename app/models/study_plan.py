from sqlalchemy import Index, Integer, Text
from sqlalchemy.orm import Mapped, mapped_column

from app.database import Base

class StudyPlan(Base):
    __tablename__ = "study_plans"
    __table_args__ = (
        Index("idx_study_plan_user_id", "user_id"),
        {"comment": "学习计划"},
    )

    user_id: Mapped[int] = mapped_column(
        Integer, comment="用户ID", nullable=False
    )
    content: Mapped[str] = mapped_column(Text, nullable=False, comment="计划内容")