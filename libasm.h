/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbelva <cbelva@student.21-school.ru>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/01/27 17:58:45 by cbelva            #+#    #+#             */
/*   Updated: 2021/02/06 20:15:28 by cbelva           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <errno.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;


size_t			ft_strlen(const char *str);
char			*ft_strcpy(char *dst, const char *src);
int				ft_strcmp(const char *s1, const char *s2);
ssize_t			ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t			ft_read(int fildes, void *buf, size_t nbyte);
char			*ft_strdup(const char *s1);
char			*ft_strchr(const char *s, int c);
int				ft_isspace(int c);
int				ft_atoi_base(char *str, char *base);
void			ft_list_push_front(t_list **begin_list, void *data);
int				ft_list_size(t_list *begin_list);
void			ft_list_sort(t_list **begin_list, int (*cmp)());
void			ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

#endif
