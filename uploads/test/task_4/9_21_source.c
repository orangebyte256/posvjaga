#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAX_COUNT 1000
#define ALPH_COUNT 4

int main(int argc, char **argv)
{
	char alph[ALPH_COUNT] = {'r', 'p', 'R', 'P'};
	int i = 0;
	int j = 0;
	int result = 0;
	int count = 0;
	char s[MAX_COUNT];
	while(scanf("%s", s) > 0)
	{
		count = strlen(s);
		for(i = 0; i < count; i++)
		{
			for(j = 0; j < ALPH_COUNT; j++)
			{
				if(s[i] == alph[j])
				{
					result++;
					goto out;
				}
			}
		}
out:;
	}
	printf("%d", result);
	return 0;
}