#include <stdio.h>



#define N 3
#define M 2

int process(int n, int m, int matrix[M][N])
{
    int result = 0;
    
    for (int i = 0; i < m; i++) 
    {
        
        for (int j = 0; j < n; j++) 
        {
            if(matrix[i][j]<0)
            { 
                result += matrix[i][j];
            }
        }
    }
    return result;

}

int main()
{
    int matrix[M][N];
    for (int i = 0; i < M; i++)
    {
        for (int j = 0; j < N; j++)
        {
            scanf("%d", &matrix[i][j]);
        }
    }
    int result = process(N, M, matrix);
    printf("%d", result);
    
    return 0;
}