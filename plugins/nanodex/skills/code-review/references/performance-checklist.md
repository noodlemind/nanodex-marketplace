# Performance Review Checklist

## Database & Queries

- [ ] No N+1 queries (associations eager-loaded where needed)
- [ ] Queries use appropriate indexes
- [ ] Large result sets are paginated
- [ ] No SELECT * when only specific columns needed
- [ ] Bulk operations used instead of individual inserts/updates in loops
- [ ] Database transactions scoped appropriately (not too broad, not too narrow)

## Algorithmic Complexity

- [ ] No O(n^2) or worse in hot paths (nested loops over collections)
- [ ] Lookups use hashes/maps instead of linear array scans
- [ ] Sorting uses built-in optimized methods
- [ ] Expensive computations cached or memoized where repeated

## Memory & Resources

- [ ] No unbounded data structures (capped collections, pagination)
- [ ] Event listeners and subscriptions cleaned up on teardown
- [ ] Large temporary objects eligible for garbage collection after use
- [ ] Streams used for large file/data processing instead of loading all into memory

## Frontend Performance

- [ ] Heavy components lazy-loaded (code splitting)
- [ ] Images optimized and appropriately sized
- [ ] No unnecessary re-renders (proper memoization)
- [ ] Expensive computations not running on every render
- [ ] Bundle size monitored (no importing entire libraries for one function)

## Network & I/O

- [ ] API responses cached where data doesn't change frequently
- [ ] Requests debounced or throttled for user-triggered actions
- [ ] No synchronous blocking I/O in request handlers
- [ ] Batch API calls where possible instead of sequential requests
- [ ] Appropriate timeout and retry strategies
