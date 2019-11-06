## shared_lock:

```
// Multiple threads/readers can read the counter's value at the same time.
  unsigned int get() const {
    std::shared_lock lock(mutex_);
    return value_;
  }
 
  // Only one thread/writer can increment/write the counter's value.
  void increment() {
    std::unique_lock lock(mutex_);
    value_++;
  }
  
  ```
  The important thing is shared_lock is shared with other threads but since there is only one mutex (lock), 
  if shared_lock needs to acquire and if it able to acquire it can only share with shared_lock not with the unique_lock.
  
  The purpose is reading value by multiple threads won't hurt but at the time of changing value no other thread should
  able to read.
  
  
  ## Wait_until:
  ```
   if(cv.wait_until(lk, now + idx*100ms, [](){return i == 1;}))
        std::cerr << "Thread " << idx << " finished waiting. i == " << i << '\n';
    else
        std::cerr << "Thread " << idx << " timed out. i == " << i << '\n';
  ```
  wait_until works as below:
  ```
  while (!pred()) {
    if (wait_until(lock, timeout_time) == std::cv_status::timeout) {
        return pred();
    }
}
return true;

  ```
  
  ## wait:
  
  There is way big difference between wait_until vs wait that is wait_util doesn't wait anymore however wait continuesly wait until the pred function returns true;
  
  ```
  while (!pred()) {
    wait(lock);
}
  ```
