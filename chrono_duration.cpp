std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();					
std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();					
int t = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
printf("feature extraction duration detection %d", t);