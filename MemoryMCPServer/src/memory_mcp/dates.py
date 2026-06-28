"""Date helpers. Accept ISO 8601 and relative shorthand ('7d', '2w', '1mo')."""
from __future__ import annotations

import re
from datetime import datetime, timedelta, timezone

_REL_RE = re.compile(r"^\s*(\d+)\s*(d|w|m|mo|y)\s*$", re.IGNORECASE)


def now_iso() -> str:
    return datetime.now(timezone.utc).isoformat()


def parse_when(s: str) -> datetime:
    """Parse ISO 8601 or relative ('7d', '2w', '1mo', '6mo', '1y').

    Relative values are interpreted as 'now minus N units'. 'm' is ambiguous
    so we treat 'm' as months when followed by 'o' ('mo'), and as months
    bare too — minutes aren't useful at memory-system scale. Use 'd' for days.
    """
    m = _REL_RE.match(s)
    if m:
        n = int(m.group(1))
        unit = m.group(2).lower()
        now = datetime.now(timezone.utc)
        if unit == "d":
            return now - timedelta(days=n)
        if unit == "w":
            return now - timedelta(weeks=n)
        if unit in ("m", "mo"):
            return now - timedelta(days=n * 30)
        if unit == "y":
            return now - timedelta(days=n * 365)

    # Fall back to ISO 8601. Python's fromisoformat handles most cases
    # including timezones in 3.11+. Bare dates get UTC midnight.
    try:
        dt = datetime.fromisoformat(s)
    except ValueError as e:
        raise ValueError(
            f"Could not parse date {s!r}. Use ISO 8601 "
            f"(2026-04-28T14:30:00+10:00) or relative (7d, 2w, 1mo, 1y)."
        ) from e
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    return dt
